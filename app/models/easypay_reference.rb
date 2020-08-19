class EasypayReference < ApplicationRecord
  belongs_to :account
  belongs_to :plan
end
