module Scenario
  module InvoiceReceipts
    class CreateClient

      attr_reader :client

      def initialize(account)
        @account = account
      end

      def create
        client_attributes = {
            name: "LSP Cliente Fatura-recibo",
            code: "12345",
            email: "lsp.performance.tests@invoicexpress.com",
            language: "pt",
            address: "Avenida da República, Lisboa",
            city: "Lisboa",
            postal_code: "1050-555",
            country: "Portugal",
            fiscal_id: "508025338",
            website: "www.invoicexpress.com",
            phone: "213456789",
            fax: "213456788",
            # preferred_contact: {
            #     "name": "Bruce Norris",
            #     "email": "email@invoicexpress.com",
            #     "phone": "213456789"
            # },
            observations: "Observations",
            send_options: "1",
            account_id: @account.id,
            phone_country_id: 1,
            version: 1
        }
        @client = Client.create(client_attributes)

        client_attributes[:client_id] = @client.id

        ClientVersion.create(client_attributes)

      end

    end
  end
end