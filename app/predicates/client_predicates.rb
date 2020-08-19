module ClientPredicates
  def portuguese?
    return true if self.country == 'Portugal'
    return self.account.portuguese? if self.country.blank?
    false
  end
end