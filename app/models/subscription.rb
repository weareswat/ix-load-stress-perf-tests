class Subscription < ApplicationRecord
  belongs_to :account
  belongs_to :plan
  belongs_to :payment, optional: true
  belongs_to :user, :foreign_key => :staff_id, optional: true
end
