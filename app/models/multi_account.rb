class MultiAccount < ApplicationRecord
  belongs_to :parent_account
  belongs_to :child_account
end
