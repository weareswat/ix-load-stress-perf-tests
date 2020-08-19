class ClientVersion < Client
  self.table_name = :client_versions

  belongs_to :client
end
