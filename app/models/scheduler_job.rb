class SchedulerJob < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :surrogate_job
end
