class PartialPayment < ApplicationRecord
  belongs_to :document
  belongs_to :account
  belongs_to :account_reset
  belongs_to :receipt
end
