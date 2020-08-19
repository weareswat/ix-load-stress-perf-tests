class MbProvider < ApplicationRecord
  belongs_to :account
  belongs_to :provider
end
