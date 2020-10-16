module Performance
  class ChangeStateStgDev

    def self.run_tests
      # params test_token -> fetch scenario info from file
      # TODO
      Concurrent::Promise.execute do
        perform_change_state(18845, "ebddf0b137d8687fc8ccc9e389274dd68c4e3bd2",  10)
      end

      Concurrent::Promise.execute do
        perform_change_state(18846, "3cf801532f9a99cf662b6d7ab5b1046961da58e0", 10)
      end
    end

    private

    def self.perform_change_state(account_id, api_key, num_docs)

      account = Account.find(account_id)
      client = Client.find_by(account_id: account_id)
      sequence = Sequence.find_by(account_id: account_id, category: "invoice_receipts")
      tax = Tax.find_by(taxable_id: account_id, taxable_type: "Account")

      invoice_receipts = Scenario::InvoiceReceipts::CreateInBulk.new(account, client, sequence, tax, num_docs)
      invoice_receipts.create

      invoices = InvoiceReceipt.where(account_id: account_id, status: "draft")

      pp invoices

      change_state_body = {"invoice_receipt":{"state":"finalized"}}

      invoices.each do | invoice |
        # call PUT /api/v3/invoice_receipts/:document-id/change-state.json
        # TODO
        #rest_endpoint = "http://localhost:#{port}/api/v3/invoice_receipts/#{invoice.id}/change-state.json?api_key=#{api_key}"
        rest_endpoint = "http://invoicexpress-v3-api-alb-1283373838.eu-west-1.elb.amazonaws.com/api/v3/invoice_receipts/#{invoice.id}/change-state.json?api_key=#{api_key}"
        logger.info "\nCalling #{rest_endpoint} for account #{account_id}"
        starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        response = ::RestClient::Request.execute(:method => :put,
                                                 :url => rest_endpoint,
                                                 :payload => change_state_body,
                                                 :headers => { :content_type => "application/json" },
                                                 :timeout => 16,
                                                 :open_timeout => 16)
        ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        elapsed = ending - starting
        logger.info "\nResponse for #{invoice.id}:\n -> #{response} \n IT TOOK #{elapsed} seconds"
          #sleep(10)
      rescue RestClient::UnprocessableEntity => unproc_ent
        logger.warn "#{unproc_ent.message} :: #{unproc_ent.response}"
        next
      rescue RestClient::Conflict => conflict
        logger.warn "#{conflict.message} :: #{conflict.response}"
        next
      rescue RestClient::Exception => conflict
        logger.warn "#{conflict.message} :: #{conflict.response}"
        next
      rescue Exception => ex
        logger.error "\n ********* DIOS MIO **********"
        logger.error "ai ai ai! tenemos un problema, señor: #{ex.message}\n#{ex.backtrace.join("\n")}"
        logger.error "*******************************"
        next
      end

    end
  end
end
