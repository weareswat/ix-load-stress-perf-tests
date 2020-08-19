class ClientPaymentReference < ApplicationRecord
  belongs_to :invoice
  belongs_to :payment_reference
end
