class TaxLocation < ApplicationRecord
  has_many :taxes, :as => :taxable
  belongs_to :tax_country
  belongs_to :currency


  #to sample data
  belongs_to :client
  belongs_to :product
  belongs_to :invoice
end
