class AccountPartnershipToken < ApplicationRecord
  belongs_to :buyer_account
  belongs_to :partnership_token
end
