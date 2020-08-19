class Payment < ApplicationRecord
  belongs_to :original_payment
  belongs_to :account
  belongs_to :plan
  belongs_to :invoice
  belongs_to :order
  belongs_to :affiliator
end
