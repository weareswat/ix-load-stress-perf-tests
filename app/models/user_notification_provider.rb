class UserNotificationProvider < ApplicationRecord
  belongs_to :user_notification
  belongs_to :provider
end
