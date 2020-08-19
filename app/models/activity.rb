class Activity < ApplicationRecord
  belongs_to :actor
  belongs_to :subject
  belongs_to :old_actor
  belongs_to :new_actor
  belongs_to :account_reset
end
