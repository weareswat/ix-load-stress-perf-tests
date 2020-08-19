module AccountPredicates
  def portuguese?
    return false if self.cached_tax_location.blank?
    self.cached_tax_location.name == 'Portugal'
  end
end