class Proforma < Estimate

  def all_series
    self.account.sequences.by_category('proformas')
  end

  def formated_type
    I18n.t("estimates.Proforma")
  end

  def notification_document_type
    "proforma"
  end

end
