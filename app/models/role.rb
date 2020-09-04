class Role < ApplicationRecord
  belongs_to :authorizable
  has_and_belongs_to_many :users, :class_name => "Membership", :foreign_key => "membership_id", :association_foreign_key => "user_id"
end
