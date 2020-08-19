class PlanDiscount < ApplicationRecord
  belongs_to :plan
  belongs_to :discount_code
end
