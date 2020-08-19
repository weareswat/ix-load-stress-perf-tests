class Product < ApplicationRecord
  belongs_to :account
  belongs_to :tax
  belongs_to :account_reset
end
