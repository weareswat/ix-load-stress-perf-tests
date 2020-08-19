class EasypayClientReference < ActiveRecord::Base

  belongs_to :easypay_client

  has_one :easypay_notification
  has_one :invoice_mb_reference, :as => :mb_reference
  has_one :account, :through => :easypay_client

end
