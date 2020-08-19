class Token < ApplicationRecord
  belongs_to :target
  belongs_to :document
end
