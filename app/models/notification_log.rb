class NotificationLog < ApplicationRecord
  belongs_to :account
  belongs_to :client
  belongs_to :document
  belongs_to :text_message
  belongs_to :membership
end
