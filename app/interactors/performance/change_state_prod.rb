module Performance
  class ChangeStateProd

    def self.run_tests(params)
      accounts = params[:accounts]
      num_docs = params[:num_docs] || 1
      env = params[:environment]
      accounts.each do |account|
        Concurrent::Promise.execute do
          perform_change_state(account[:subdomain], account[:api_key], env, num_docs, account[:sequence_id], account[:doc_type])
        end
      end
    end

    private

    def self.perform_change_state(subdomain, api_key, env, num_docs, sequence_id, doc_type)

      invoices = create_documents(subdomain, api_key, env, num_docs, sequence_id, doc_type)

      change_state_body = {"#{doc_type}": {"state": "finalized"}}
      invoices.each do |invoice_id|

        # call PUT /api/v3/invoice_receipts/:document-id/change-state.json
        rest_endpoint = change_state_endpoint(subdomain, api_key, env, invoice_id, doc_type)

        Rails.logger.info "\nCalling #{rest_endpoint} body: #{change_state_body}"
        starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        response = ::RestClient::Request.execute(:method => :put,
                                                 :url => rest_endpoint,
                                                 :payload => change_state_body,
                                                 :headers => {:content_type => "application/json"},
                                                 :timeout => 16,
                                                 :open_timeout => 16)
        ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        elapsed = ending - starting
        Rails.logger.info "\nResponse for #{invoice_id}:\n -> #{response} \n IT TOOK #{elapsed} seconds"
          #sleep(10)
      rescue RestClient::UnprocessableEntity => unproc_ent
        Rails.logger.warn "#{unproc_ent.message} :: #{unproc_ent.response}"
        next
      rescue RestClient::Conflict => conflict
        Rails.logger.warn "#{conflict.message} :: #{conflict.response}"
        next
      rescue RestClient::Exception => conflict
        Rails.logger.warn "#{conflict.message} :: #{conflict.response}"
        next
      rescue Exception => ex
        Rails.logger.error "\n ********* DIOS MIO **********"
        Rails.logger.error "ai ai ai! tenemos un problema, señor: #{ex.message}\n#{ex.backtrace.join("\n")}"
        Rails.logger.error "*******************************"
        next
      end
    end

    private

    def self.create_documents(subdomain = 'bodesvermelhos', api_key = '5312d0f8f4a20479eb8ae1f44fc973086da07978', env = 'production', num_docs = 1,
                              sequence_id, doc_type)
      ids = []

      num_docs.times do
        proprietary_uid = generate_proprietary_uid
        date = Date.today.strftime('%Y-%m-%d')
        create_body = {
            "#{doc_type}": {
                "date": date,
                "due_date": date,
                "reference": proprietary_uid,
                "observations": "Este documento foi automaticamente emitido com os dados fiscais inseridos durante o processo de registo na loja",
                "sequence_id": sequence_id,
                "client": {
                    "name": "António Silva",
                    "email": "antonio.silva@mail.com",
                    "fiscal_id": "242999999",
                    "code": "C123"
                },
                "items": [
                    {"name": "Artigo", "description": "Produto X",
                     "unit_price": "13.1132", "quantity": "1", "tax": {"name": "IVA23"}, "unit": "service", "discount": "0"}
                ]
            },
            "proprietary_uid": proprietary_uid
        }

        rest_endpoint = create_endpoint(subdomain, api_key, doc_type, env)
        puts "\nCreating document: #{rest_endpoint}"
        response = ::RestClient::Request.execute(:method => :post,
                                                 :url => rest_endpoint,
                                                 :payload => create_body,
                                                 :headers => {:content_type => "application/json"},
                                                 :timeout => 16,
                                                 :open_timeout => 16)

        response_id = JSON.parse(response)["#{doc_type}"]["id"]
        ids << response_id

        puts "Document created (#{subdomain}):  #{response}"
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

      ids
    end

    def self.create_endpoint(subdomain, api_key, doc_type, env = 'production')
      if env == 'staging'
        "http://#{subdomain}.obiwan.rupeal.com/i#{doc_type}s.json?api_key=#{api_key}"
      elsif env == 'development'
        "http://localhost:3001/#{doc_type}s.json?api_key=#{api_key}"
      elsif env == 'production'
        "https://#{subdomain}.app.invoicexpress.com/#{doc_type}s.json?api_key=#{api_key}"
      end
    end

    def self.change_state_endpoint(subdomain, api_key, env = 'production', invoice_id, doc_type)
      if env == 'staging'
        "http://#{subdomain}.obiwan.rupeal.com/#{doc_type}s/#{invoice_id}/change-state.json?api_key=#{api_key}"
      elsif env == 'development'
        "http://localhost:3001/#{doc_type}/#{invoice_id}s/change-state.json?api_key=#{api_key}"
      elsif env == 'production'
        "https://#{subdomain}.app.invoicexpress.com/#{doc_type}s/#{invoice_id}/change-state.json?api_key=#{api_key}"
      end
    end

    def self.generate_proprietary_uid
      SecureRandom.uuid
    end

  end
end
