class PaymentNotification < ApplicationRecord
  belongs_to :account
  belongs_to :subscription
  belongs_to :plan
end
