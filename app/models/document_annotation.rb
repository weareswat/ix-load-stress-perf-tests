class DocumentAnnotation < ApplicationRecord
  belongs_to :document
  belongs_to :account
end
