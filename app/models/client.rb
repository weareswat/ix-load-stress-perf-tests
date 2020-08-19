class Client < ApplicationRecord
  belongs_to :account
  belongs_to :currency, optional: true

  has_many :documents, class_name: 'Invoice'

  include ClientPredicates

  def country_code
    country_code = TaxCountry.country_codes["#{self.country}"]

    if country_code.present?
      country_code
    else
      TaxCountry.country_codes["#{self.account.tax_location.name}"]
    end
  end

  def get_version(v)
    @cached_versions ||= {}

    return @cached_versions[v] if @cached_versions[v].present?
    @cached_versions[v] = v.nil? ? self : ClientsDb.get_version(self.id, v)
  end
end