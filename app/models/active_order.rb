class ActiveOrder < ApplicationRecord
  belongs_to :account
  belongs_to :express_payer
end
