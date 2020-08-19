class ReceiptData < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :document, :class_name => 'Invoice'

  self.table_name = 'receipt_datas'
end
