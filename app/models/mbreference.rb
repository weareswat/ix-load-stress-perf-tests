class Mbreference < ApplicationRecord
  belongs_to :account
  belongs_to :plan
  has_one :payment, :as => :original_payment
  has_one :order, :as => :payment_data
end
