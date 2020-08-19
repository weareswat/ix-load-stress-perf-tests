class FeatureFlagsAccounts < ActiveRecord::Base

  self.table_name = "feature_flags_accounts"

  belongs_to :account
  belongs_to :feature_flag
end