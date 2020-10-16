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
    ::Performance::ChangeStateStgDev.run_tests
  end

  def concurrent_production
    ::Performance::ChangeStateProd.run_tests(params)
  end

end
