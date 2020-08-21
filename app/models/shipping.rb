class Shipping < Guide

  def all_series
    self.account.sequences.by_category('shippings')
  end

  def formated_type
    I18n.t("guides.Shipping")
  end

end
