class LastPresentedFeature < ApplicationRecord
  belongs_to :new_features
  belongs_to :users
end
