class EasypayNotification < ApplicationRecord
  belongs_to :easypay_reference
  belongs_to :easypay_client_reference
end
