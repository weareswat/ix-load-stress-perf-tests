class Order < ApplicationRecord
  belongs_to :account
  belongs_to :plan
  belongs_to :payment_data
  belongs_to :parent
end
