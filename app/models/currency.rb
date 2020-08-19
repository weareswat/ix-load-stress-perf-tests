class Currency < ApplicationRecord

  def self.default_currency
    self.first
  end

end