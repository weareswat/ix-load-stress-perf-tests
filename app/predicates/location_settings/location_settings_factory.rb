module LocationSettings
  module LocationSettingsFactory
    COUNTRIES = {
      'Portugal' => LocationSettings::ReasonsAndCodes::PtReasonsAndCodes
    }

    DEFAULT = LocationSettings::ReasonsAndCodes::DefaultReasonAndCode

    def self.location_settings_class(country)
      COUNTRIES.fetch(country, DEFAULT)
    end
  end
end