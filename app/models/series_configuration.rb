class SeriesConfiguration < ApplicationRecord
  belongs_to :phone_country
  belongs_to :picture
  belongs_to :account
end
