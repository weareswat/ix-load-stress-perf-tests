module LocationSettings
  module ReasonsAndCodes
    class DefaultReasonAndCode
      REASONS = {
        '' => ''
      }.freeze

      def self.saft_exemption_reason
        REASONS[saft_exemption_code]
      end

      def self.saft_exemption_code
        ''
      end
    end
  end
end
