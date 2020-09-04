class Tax < ApplicationRecord
  belongs_to :taxable, :polymorphic => true
  has_many :tax_instances, :dependent=>:destroy
end
