require 'rest-client'
require 'concurrent'

class Performance::Api::CreateController < ApplicationController

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

  def sequential_proprietary_uid
    env = params[:environment] || 'development'
    subdomain = params[:subdomain] || ''
    api_key = params[:api_key] || 'aminhakey'
    num_requests = params[:num_requests] || 2
    num_processes = params[:num_processes] || 1

    proprietary_uid = generate_proprietary_uid
    num_processes.times do
      Concurrent::Promise.execute do
        # Example for Staging environment
        # perform_create("cenasdosdemnios", "4164ff18e41aa218e182906ef6bab5aa12a442af",  2, proprietary_uid)
        #
        # Example for Production environment
        # perform_create("bodesvermelhos", "5312d0f8f4a20479eb8ae1f44fc973086da07978",  2, proprietary_uid)
        perform_create(subdomain, api_key, num_requests, proprietary_uid, env)
      end
    end

  end

  private

  def perform_create(subdomain, api_key, num_docs, proprietary_uid, env)
    create_body = {
        "invoice": {
            "date": "2020-10-24",
            "due_date": "2020-10-24",
            "reference": "bolt-i-31237123189981adsasd",
            "observations": "Este documento foi automaticamente emitido com os dados fiscais inseridos durante o processo de registo na loja",
            "sequence_id": "1744919",

            "client": {
                "name": "António Silva",
                "email": "antonio.silva@mail.com",
                "fiscal_id": "242999999",
                "code": "C123"
            },
            "items": [
                {"name": "Artigo", "description": "Produto X",
                 "unit_price": "13.1132","quantity": "1","tax": {"name": "IVA23"}, "unit": "service","discount": "0"}
            ]
        },
        "proprietary_uid": proprietary_uid
    }

    num_docs.times do
      # call POST http://cenasdosdemnios.obiwan.rupeal.com/invoices.json?api_key=4164ff18e41aa218e182906ef6bab5aa12a442af
      rest_endpoint = endpoint(subdomain, api_key, env)
      puts "\nCalling #{rest_endpoint} with UID #{proprietary_uid}"
      starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      response = ::RestClient::Request.execute(:method => :post,
                                    :url => rest_endpoint,
                                    :payload => create_body,
                                    :headers => { :content_type => "application/json" },
                                    :timeout => 16,
                                    :open_timeout => 16)
      ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      elapsed = ending - starting

      response_id = JSON.parse(response)["invoice"]["id"]
      @invoice_id ||= response_id

      puts "OOPS Prop UID not working" if @invoice_id != response_id

      puts "Previously created ID=#{@invoice_id} :: #{response_id}"

      puts "Response for #{rest_endpoint}:\n -> #{response} \n IT TOOK #{elapsed} seconds"
    rescue RestClient::UnprocessableEntity => unproc_ent
      puts "#{unproc_ent.message} :: #{unproc_ent.response}"
      next
    rescue RestClient::Conflict => conflict
      puts "YAY! We've prevented duplicates: #{conflict.message} :: #{conflict.response}"
      puts "#{conflict.message} :: #{conflict.response}"
      next
    rescue Exception => ex
      puts "\n ********* DIOS MIO **********"
      puts "ai ai ai! tenemos un problema, señor: #{ex.message}\n#{ex.backtrace.join("\n")}"
      puts "*******************************"
      next
    end
  end

  def endpoint(subdomain, api_key, env = 'development')
    if env == 'staging'
      "http://#{subdomain}.obiwan.rupeal.com/invoices.json?api_key=#{api_key}"
    elsif env == 'development'
      "http://localhost:3001/invoices.json?api_key=#{api_key}"
    elsif env == 'production'
      "https://#{subdomain}.app.invoicexpress.com/invoices.json?api_key=#{api_key}"
    end
  end

  def generate_proprietary_uid
    "bodesvermes-89231dsskj2310"
  end

end
