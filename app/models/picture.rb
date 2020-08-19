class Picture < ApplicationRecord
  belongs_to :owner, :polymorphic => true
end
