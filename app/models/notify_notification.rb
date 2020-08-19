class NotifyNotification < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :account
end
