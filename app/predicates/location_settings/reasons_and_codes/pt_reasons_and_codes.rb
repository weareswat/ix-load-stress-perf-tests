module LocationSettings
  module ReasonsAndCodes
    class PtReasonsAndCodes
      REASONS = {
        'M99' => 'Não sujeito; não tributado (ou similar).',
        'M12' => 'Regime da margem de lucro – Agências de viagens.',
        'M13' => 'Regime da margem de lucro – Bens em segunda mão.',
        'M14' => 'Regime da margem de lucro – Objetos de arte.',
        'M15' => 'Regime da margem de lucro–Objetos de coleção e antiguidades.'
      }.freeze

      def self.saft_exemption_reason
        REASONS[saft_exemption_code]
      end

      def self.saft_exemption_code
        'M99'
      end

      def self.special_vat_codes
        ['M12', 'M13', 'M14', 'M15']
      end
    end
  end
end
