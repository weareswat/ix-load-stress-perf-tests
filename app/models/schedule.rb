class Schedule < ApplicationRecord
  belongs_to :invoice
  belongs_to :account
  belongs_to :account_reset
end
