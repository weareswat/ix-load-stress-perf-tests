class PlanProvider < ApplicationRecord
  belongs_to :plan
  belongs_to :provider
end
