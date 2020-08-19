class Account < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :clients, dependent: :destroy
  has_many :documents, class_name: "Invoice"

  belongs_to :currency
  belongs_to :provider, :class_name => "Provider", :foreign_key => "provider_id"
  belongs_to :tax_location
  belongs_to :picture, :class_name => "AccountPicture", :foreign_key => "picture_id", optional: true

  has_one :current_subscription, -> { order 'id desc' }, class_name: "Subscription"

  scope :not_deleted, -> { where(:deleted_flag => false) }

  scope :portuguese, -> { Account.join(:tax_locations).where('tax_locations.name' => 'Portugal') }

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
end
