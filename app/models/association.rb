class Association < ApplicationRecord
  belongs_to :account
  belongs_to :client
  belongs_to :associated_account
  belongs_to :associated_contact
end
