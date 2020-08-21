class Account < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :clients, dependent: :destroy
  has_many :documents, class_name: "Invoice"

  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"

  belongs_to :currency
  belongs_to :provider, :class_name => "Provider", :foreign_key => "provider_id"
  belongs_to :tax_location
  belongs_to :default_tax, :class_name => "Tax", :foreign_key => "current_tax_id"
  belongs_to :picture, :class_name => "AccountPicture", :foreign_key => "picture_id", optional: true

  has_many :subscriptions, -> { order('created_at ASC') }, :dependent=>:destroy

  has_one :current_subscription, -> { order('id desc') }, class_name: "Subscription"

  scope :not_deleted, -> { where(deleted_flag: false) }

  scope :portuguese, -> { Account.join(:tax_locations).where('tax_locations.name' => 'Portugal') }

  has_many :sequences
  has_many :invoices_sequences, -> { where(category: 'invoices') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :credit_notes_sequences, -> { where(category: 'credit_notes') }, :class_name => "Sequence",  :dependent=>:destroy, inverse_of: false
  has_many :debit_notes_sequences, -> { where(category: 'debit_notes') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :receipts_sequences, -> { where(category: 'receipts') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :cash_invoices_sequences, -> { where(category: 'cash_invoices') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :vat_moss_invoices_sequences, -> { where(category: 'vat_moss_invoices') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :vat_moss_credit_notes_sequences, -> { where(category: 'vat_moss_credit_notes') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :vat_moss_receipts_sequences, -> { where(category: 'vat_moss_receipts') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false

  has_many :shippings_sequences, -> { where(category: 'shippings') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :transports_sequences, -> { where(category: 'transports') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :devolutions_sequences, -> { where(category: 'devolutions') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :proformas_sequences, -> { where(category: 'proformas') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :fees_notes_sequences, -> { where(category: 'fees_notes') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :simplified_invoices_sequences, -> { where(category: 'simplified_invoices') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :invoice_receipts_sequences, -> { where(category: 'invoice_receipts') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :quotes_sequences, -> { where(category: 'quotes') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false
  has_many :purchase_orders_sequences, -> { where(category: 'purchase_orders') }, :class_name => "Sequence", :dependent=>:destroy, inverse_of: false

  has_many :mbreferences, :dependent=>:destroy

  include AccountPredicates

  def location_settings
    LocationSettings::LocationSettingsFactory.location_settings_class(tax_location.name)
  end

  def tax_exemption_reasons
    location_settings
  end

  def get_version(v)
    @cached_versions ||= {}
    @cached_versions[v] ||= v.nil? ? self : AccountsDb.get_version(self.id, v)
  end

  def cached_tax_location
    @cached_tax_location ||= self.tax_location
  end

  def currency_name
    if self.currency.present?
      self.currency.name
    else
      default = Currency.default_currency
      default.present? ? default.name : "EUR"
    end
  end

  def e_signature_active?
    return false unless current_subscription.present?
    return false unless current_subscription.plan.present?
    self.current_subscription.plan.allow_signature and !self.esignature.blank?
  end

  # https://signalvnoise.com/archives2/id_partitioning.php
  def picture_url
    account_id = self.id.to_s
    host = Provider.select_host
    dir1 = ("%08d" % account_id)[0...4]
    dir2 = ("%08d" % account_id)[4...8]
    filename = "#{picture.id}_#{picture.filename}"
    "http://www.#{host}/account_pictures/#{dir1}/#{dir2}/#{filename}"
  end

  def resolve_account_name!
    return if self.name.present?

    self.name = self.organization_name.gsub(/[^a-zA-Z0-9]/, '').downcase.slice(0..16)
    self.name = "a#{self.name}" if self.name =~ /^\d/

    template_name = self.name
    counter = 0

    begin
      other = Account.find_by_name(self.name)
      if other.present? && other.id != self.id
        counter += 1
        self.name = "#{template_name}-#{counter}"
      end
    end while other.present?

  end

  def generate_account_id!
    self.generate_secure_key!
  end

  def generate_secure_key!
    self.update_attribute(:account_id, secure_digest(Time.now, (1..10).map{ rand.to_s }))
  end

  def secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end

  def configure_default_subscription
    plan = Plan.find(68)

    if subscriptions.size == 0
      return create_subscription(plan, self, nil, "credit_plan", 50, 12, true)
    end

    subs = current_subscription
    if subs.plan.nil?
      subs.plan = plan
      subs.save
    end

    subs
  end

  def activate_and_setup_defaults
    self.state = 'active'
    self.activated_at = Time.now

    self.default_tax = tax_location.taxes.first
    self.time_zone=tax_location.time_zone
    self.currency=tax_location.currency

    # self.create_account_system_user
    self.owner.dismiss_time=Time.now
    self.sequence_number_mode = "auto"
    self.save
  end

  def create_subscription(plan, account, payment, payment_type, value, duration=1, to_save=true)
    subscription_params = new_subscription_params(plan, account, payment, payment_type, value, duration)
    subscription = Subscription.new(subscription_params)

    subscription.save!

    account.subscriptions << subscription

    account.purchased_at = Time.now
    account.save!
  end


  def create_default_sequences
    CreateSequence.run!(self, self.name.upcase.gsub(/([^a-zA-Z0-9])/,""), :default_sequence => true)
  end


  def new_subscription_params(plan, account, payment, payment_type, value, duration)

    new_subscription_hash = {
        :plan_id => plan.id,
        :account_id => account.id,
        :start_date  => Time.now,
        :end_date => Time.now.advance(:months => duration),
        :payment_type  => payment_type,
        :value =>  value,
        :monthly_fee => value,
        :sms_paid => 0,
        :payment => payment,
        :auto_renewal => 0,
        :documents_paid => 500000,
        :staff_id => nil,
        :payment_id => nil
    }

    new_subscription_hash
  end
end
