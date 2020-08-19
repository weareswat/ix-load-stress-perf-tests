class CommentVersion < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  belongs_to :invoice
end
