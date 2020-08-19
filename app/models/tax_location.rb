class TaxLocation < ApplicationRecord
  belongs_to :tax_country
  #belongs_to :currency
  #belongs_to :client
  #belongs_to :product
  #belongs_to :invoice
end
