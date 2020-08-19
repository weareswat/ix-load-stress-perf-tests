class Performance::API::ChangeStateController < ApplicationController

  def settings
    # params db connection ?
    # params env ?
    # params domains ?
  end

  def concurrent
    # params test_token

    # read test_token file for ids

  end

  def create_scenario
    # generate test_token

    # save doc ids in test_token file

    # return test_token
  end

  def destroy_scenario
    # params test_token

    # read test_token file for ids

    # delete test_token file
  end

end