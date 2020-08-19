class EstimateType
  def self.accounting_relevant
    [quote, proforma, fees_note]
  end

  def self.quote
    'Quote'.freeze
  end

  def self.proforma
    'Proforma'.freeze
  end

  def self.fees_note
    'FeesNote'.freeze
  end
end