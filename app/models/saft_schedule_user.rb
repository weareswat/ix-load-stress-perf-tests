class SaftScheduleUser < ApplicationRecord
  belongs_to :saft_schedule
  belongs_to :user
end
