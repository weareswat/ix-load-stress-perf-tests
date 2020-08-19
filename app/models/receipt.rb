class Receipt < Invoice
  has_many :receipts, class_name: 'Invoice', foreign_key: 'owner_invoice_id'
  has_many :payment_items, class_name: 'PartialPayment', foreign_key: 'receipt_id'

  belongs_to :owner_invoice, class_name: 'Invoice'

  def balance_signal
    -1
  end

  def cached_receipt_datas
    @cached_receipt_datas ||= self.receipt_datas
  end
end