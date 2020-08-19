class FeatureFlagsAccount < ApplicationRecord
  belongs_to :feature_flag
  belongs_to :account
end
