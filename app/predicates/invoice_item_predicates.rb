module InvoiceItemPredicates
  def tax_exempt?
    self.tax_value == 0.0
  end
end