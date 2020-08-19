class AtRequest < ApplicationRecord
  belongs_to :at_document_status
  belongs_to :account
  belongs_to :invoice
end
