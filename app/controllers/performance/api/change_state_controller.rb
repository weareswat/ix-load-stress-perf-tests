class Performance::Api::ChangeStateController < ApplicationController

  def settings
    # params db connection ?
    # params env ?
    # params domains ?
  end

  def concurrent
    # params test_token -> fetch scenario info from file
    # TODO
    Scenario::InvoiceReceipts::CreateInBulk.new

    invoices = Invoice.find(account_id: 58561, status: "draft")
    invoices.each do | invoice |
      # call PUT /api/v3/invoice_receipts/:document-id/change-state.json
      # TODO
    end

  end

  def create_scenario
    # generate test_token
    # TODO

    # Create account, simulating POST /api/accounts/create_already_user.json
    scenario = Scenario::Account::CreateForExistingUser.new('joao.borges@rupeal.com')
    scenario.create

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
        token: ""
    }
  end

  def destroy_scenario
    # params test_token

    # read test_token file for ids

    # delete test_token file
  end

end
