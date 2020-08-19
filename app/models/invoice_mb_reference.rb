class InvoiceMbReference < ApplicationRecord
  belongs_to :mb_reference, :polymorphic => true
  belongs_to :invoice
end