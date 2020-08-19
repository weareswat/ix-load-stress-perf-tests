class Estimate < Invoice
  has_many :invoices, foreign_key: 'owner_invoice_id'

  def self.types
    [
      Quote,
      Proforma,
      FeesNote
    ]
  end
end