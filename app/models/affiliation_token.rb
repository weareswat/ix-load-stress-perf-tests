class AffiliationToken < ApplicationRecord
  belongs_to :parent
  belongs_to :affiliation_discount
  belongs_to :affiliation_condition
end
