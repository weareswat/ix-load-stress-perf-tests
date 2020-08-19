module InvoicePredicates
  def note?
    [CreditNote, DebitNote].include?(self.class)
  end
end