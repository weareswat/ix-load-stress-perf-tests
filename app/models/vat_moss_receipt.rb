class VatMossReceipt < Receipt
  
  belongs_to :owner_invoice, :class_name => "VatMossInvoice"

  def taxes_per_categories
    #result = CalculateReceiptTaxSummary.new(self).run!
    #result[:tax_summary]
  end
  
  def accounting_relevant?
    false
  end
  

  
  def vat_moss_receipt?
    true
  end
end
