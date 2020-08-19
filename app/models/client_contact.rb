class ClientContact < ApplicationRecord
  belongs_to :client
  belongs_to :tax_country
  belongs_to :mobile_country
end
