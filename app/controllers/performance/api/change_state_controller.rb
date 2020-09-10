require 'rest-client'
require 'concurrent'

class Performance::Api::ChangeStateController < ApplicationController

  def settings
    # params db connection ?
    # params env ?
    # params domains ?
  end

  def create_scenario
    # generate test_token
    # TODO

    # Create account, simulating POST /api/accounts/create_already_user.json
    scenario = Scenario::Account::CreateForExistingUser.new('joao.borges@rupeal.com')
    scenario.create

    client = Scenario::InvoiceReceipts::CreateClient.new(scenario.account)
    client.create

    # save doc ids in test_token file
    # TODO

    # read test_token file for ids

    # return test_token
    # TODO

    render json: {
        user: scenario.user,
        account: scenario.account,
        current_membership: scenario.current_membership,
        email: scenario.email,
        client: client.client,
        tax: scenario.tax,
        token: ""
    }
  end

  def destroy_scenario
    # params test_token

    # read test_token file for ids

    # delete test_token file
  end

  def concurrent
    # params test_token -> fetch scenario info from file
    # TODO
    Concurrent::Promise.execute do
      perform_change_state(18835, "d8b47f69db13c524e99c90b514e72681b8c67f63",  13)
    end

    Concurrent::Promise.execute do
      perform_change_state(18836, "5d778de5d45def2c425c0620da7b6caf06bd1af6", 13)
    end
  end

  private

  def perform_change_state(account_id, api_key, num_docs)

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
      puts "\nCalling #{rest_endpoint} for account #{account_id}"
      starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      response = ::RestClient::Request.execute(:method => :put,
                                    :url => rest_endpoint,
                                    :payload => change_state_body,
                                    :headers => { :content_type => "application/json" },
                                    :timeout => 16,
                                    :open_timeout => 16)
      ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      elapsed = ending - starting
      puts "Response for #{invoice.id}:\n -> #{response} \n IT TOOK #{elapsed} seconds"
      #sleep(10)
    rescue Exception => ex
      puts "\n ********* DIOS MIO **********"
      puts "ai ai ai! tenemos un problema, señor: #{ex.message}"
      puts "*******************************"
      #sleep(10)
      next
    end
  end

end
