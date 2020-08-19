class Subscription < ApplicationRecord
  belongs_to :account
  belongs_to :plan
  belongs_to :payment
  belongs_to :staff
end
