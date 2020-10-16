require 'net/ssh/gateway'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # gateway = Net::SSH::Gateway.new('obiwan', 'ec2-user')
  # port = gateway.open('127.0.0.1', 3306, 3307)

  # establish_connection(
  #     adapter: 'mysql2',
  #     host: '127.0.0.1',
  #     username: 'root',
  #     password: 'rupeal2012',
  #     database: 'invoicexpress_database_restore',
  #     port: port
  # )
end
