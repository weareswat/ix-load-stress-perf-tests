class User < ApplicationRecord
  belongs_to :account
  belongs_to :old_account
end
