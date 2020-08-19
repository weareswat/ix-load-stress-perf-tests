class AccountVersion < Account
  self.table_name = :account_versions

  belongs_to :account
end
