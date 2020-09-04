class Invoice < ApplicationRecord
  has_one :invoice_mb_reference
  has_one :client_reference

  has_one :imported_invoice

  has_many :items, class_name: 'InvoiceItem', dependent: :destroy
  has_many :receipt_datas, :foreign_key => :receipt_id
  has_many :related_documents, -> { where "(status!='deleted')" }, class_name: 'Invoice', :foreign_key => 'owner_invoice_id'

  scope :invoices, -> { where "type IS NULL" }
  scope :non_deleted, -> { where("status <> 'deleted'") }
  scope :order_by_ascending_creation, -> { order("created_at") }
  scope :communicable_to_at, -> { where "(type IN (?) OR type IS NULL) AND status IN (?)",
                                       document_types_for_communication,
                                       InvoiceStatus.status_communicable_to_at }

  belongs_to :owner_invoice,   :class_name => 'Invoice', :optional => true
  belongs_to :account_wrapper, :class_name => 'Account', :foreign_key => 'account_id'
  belongs_to :client_wrapper,  :class_name => 'Client',  :foreign_key => 'client_id'
  belongs_to :sequence, optional: true
  belongs_to :currency, optional: true

  include InvoicePredicates

  def self.relevant_status_for_communication
    InvoiceStatus.status_communicable
  end

  def self.at_relevant_working_documents_status
    InvoiceStatus.working_documents_status
  end

  def self.canceled_status
    InvoiceStatus.canceled
  end

  # Returns the client version model of the document calling this method.
  def client_version_model
    return client_wrapper if self.client_version.nil?
    ClientsDb.get_version(self.client_id, self.client_version) unless client_wrapper.nil?
  end

  # Returns the client version model of the owner invoice of the document calling this method.
  def client
    return client_wrapper if client_version.nil?
    ClientsDb.get_version(self.client_id, client_version) unless client_wrapper.nil?
  end

  def client=(client)
    self.client_wrapper = client
  end

  # Returns the account version model of the owner invoice of the document calling this method.
  def account
    return account_wrapper if self.account_version.nil?
    AccountsDb.get_version(self.account_id, self.account_version) unless account_wrapper.nil?
  end

  def account=(account)
    self.account_wrapper = account
  end

  def self.document_types_for_saft
    invoice_types_for_saft + work_documents_types_for_saft + [Receipt]
  end

  def self.document_types_for_communication
    invoice_types_for_saft + Guide.types + [Receipt]
  end

  def self.invoice_types_for_saft
    debit_types + credit_types
  end

  def self.invoice_types_with_vat_moss
    debit_types + [VatMossInvoice] + credit_types + [VatMossCreditNote]
  end

  def self.work_documents_types_for_saft
    Estimate.types + [PurchaseOrder]
  end

  def self.debit_types
    [
      Invoice,
      InvoiceReceipt,
      SimplifiedInvoice,
      CashInvoice,
      DebitNote
    ]
  end

  def self.credit_types
    [CreditNote]
  end

  def iva_caixa?
    self.account.iva_caixa?
  end

  def balance_signal
    1
  end

  def taxes_per_categories
    @taxes_per_categories ||= Invoices::TaxesPerCategoriesCalculator.run(self)
  end

  def factura_recibo?
    self.class == Invoice && self.account.present? && self.account.factura_recibo
  end

  def draft?
    status == InvoiceStatus.draft
  end

  def filename
    "#{self.formatted_type.gsub('/','_')}-#{inverted_sequence_number.parameterize}"
  end

  def owner_invoice_valid?
    owner_invoice && owner_invoice.account_id == account_id
  end

end
