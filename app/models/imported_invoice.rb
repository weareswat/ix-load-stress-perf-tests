class ImportedInvoice < ApplicationRecord
  belongs_to :invoice
  belongs_to :document_batch, :foreign_key => 'batch_id'
end
