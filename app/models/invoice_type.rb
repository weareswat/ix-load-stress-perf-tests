class InvoiceType
  def self.accounting_relevant
    debit + credit
  end

  def self.debit
    [invoice, cash_invoice, debit_note, invoice_receipt, vat_moss_invoice, simplified_invoice]
  end

  def self.credit
    [credit_note, vat_moss_credit_note]
  end

  def self.invoice
    'Invoice'
  end

  def self.simplified_invoice
    'SimplifiedInvoice'
  end

  def self.invoice_receipt
    'InvoiceReceipt'
  end

  def self.vat_moss_invoice
    'VatMossInvoice'
  end

  def self.vat_moss_receipt
    'VatMossReceipt'
  end

  def self.vat_moss_credit_note
    'VatMossCreditNote'
  end

  def self.debit_note
    'DebitNote'
  end

  def self.credit_note
    'CreditNote'
  end

  def self.cash_invoice
    'CashInvoice'
  end

  def self.receipt
    'Receipt'
  end

  def self.purchase_order
    'PurchaseOrder'
  end

  def self.receipt_types
    [self.receipt, self.vat_moss_receipt]
  end

  def self.document_type(document)
    return self.invoice_receipt if document.factura_recibo?
    document.class.name
  end
end