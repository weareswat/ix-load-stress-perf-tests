module Scenario
  module InvoiceReceipts
    class CreateInBulk

      attr_reader :invoice_receipts

      def initialize(account, client, sequence, tax, num_of_documents)
        # TODO create invoices
        @account = account
        @client = client
        @sequence = sequence
        @num_of_documents = num_of_documents
        @tax = tax
      end

      def create
        @num_of_documents.times do
          invoice_receipt = InvoiceReceipt.create({
                                  "account": @account,
                                  "client": @client,
                                  "status": "draft",
                                  "sequence": @sequence,
                                  "archived": false,
                                  "tax_exemption_code": "M00",
                                  "tax_exemption_message": "Sem Isenção. ",
                                  "date": "24/08/2020",
                                  "due_date": "24/08/2020",

                                  #"date": "24/09/2020",
                                  #"due_date": "23/10/2020",
                                  "currency_id": 1,
                                  "rate": 1.0,
                                  "subtotal": 100.0,
                                  "total_before_taxes": 100.0,
                                  "total_taxes": 23.0,
                                  "total": 123.0,
                                  "raw_subtotal": 100.0,
                                  "raw_total_before_taxes": 100.0,
                                  "raw_total_taxes": 23.0,
                                  "raw_total": 123.0,
                                  "reference": "LSPT001",
                                  "observations": "This was created by LSP tests",
                                })


          InvoiceItem.create({
                                                "name": "LSPT Item",
                                                "description": "Item used for performance tests",
                                                "unit_price": 100.0,
                                                "unit": "service",
                                                "quantity": 1.0,
                                                "tax": @tax,
                                                "subtotal": 100.0,
                                                "tax_amount": 23.0,
                                                "total": 123.0,
                                                "rrp": 123.0,
                                                "raw_subtotal": 100.0,
                                                "raw_tax_amount": 23.0,
                                                "raw_total": 123.0,
                                                "raw_rrp": 123.0,
                                                "tax_code": "OUT",
                                                "tax_region": "PT",
                                                "tax_name": "IVA23",
                                                "invoice_id": invoice_receipt.id
                                            })
          end
      end

    end
  end
end