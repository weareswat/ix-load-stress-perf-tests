class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product, optional: true
  belongs_to :tax

  include InvoiceItemPredicates

  def saft_exemption_reason
    default_exemption_message = tax_exemption_reasons.saft_exemption_reason

    if self.tax_exempt? && self.invoice.tax_exemption_message.present?
      self.invoice.tax_exemption_message
    else
      default_exemption_message
    end
  end

  def saft_exemption_code
    default_exemption_code = tax_exemption_reasons.saft_exemption_code

    if self.tax_exempt? && self.invoice.tax_exemption_code.present?
      self.invoice.tax_exemption_code
    else
      default_exemption_code
    end
  end

  def tax_exemption_reasons
    self.invoice.account.tax_exemption_reasons
  end
end