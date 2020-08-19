class ScheduleException < ApplicationRecord
  belongs_to :schedule
  belongs_to :invoice
end
