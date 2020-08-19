class Tax < ApplicationRecord
  belongs_to :tax_instance
  belongs_to :taxable
end
