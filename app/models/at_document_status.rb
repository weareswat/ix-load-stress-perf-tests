class AtDocumentStatus < ApplicationRecord
  belongs_to :invoice
  belongs_to :delayed_job
  belongs_to :account
end
