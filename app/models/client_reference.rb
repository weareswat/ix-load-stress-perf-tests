class ClientReference < ApplicationRecord
  belongs_to :compra_facil
  belongs_to :invoice

  def supports_credit_card?
    false
  end

  def payment_type
    "MB"
  end
end
