class Rejection < ApplicationRecord
  belongs_to :invoice
  belongs_to :account
  belongs_to :supplier_client
  belongs_to :rejected_by_user
end
