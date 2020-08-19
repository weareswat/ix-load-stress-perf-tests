class Sequence < ApplicationRecord
  belongs_to :account
  #belongs_to :account_reset
  belongs_to :series_configuration
end
