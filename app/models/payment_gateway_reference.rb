class PaymentGatewayReference < ApplicationRecord
  belongs_to :payment_gateway_provider
  belongs_to :account_reset
end
