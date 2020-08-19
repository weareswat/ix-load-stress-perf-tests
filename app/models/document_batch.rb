class DocumentBatch < ApplicationRecord
  belongs_to :account
  has_many :imported_invoices
end
