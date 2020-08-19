class MembershipsRole < ApplicationRecord
  belongs_to :membership
  belongs_to :role
end
