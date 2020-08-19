class Address < ActiveRecord::Base
  belongs_to :tax_location
  
  def full
    "#{self.detail.strip}\n#{self.postal_code} #{self.city.strip}\n#{self.tax_location.name}"
  end

  def portuguese?
    tax_location.name == 'Portugal'
  end
end
