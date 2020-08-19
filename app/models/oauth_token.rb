class OauthToken < ApplicationRecord
  belongs_to :provider
  belongs_to :client_application
end
