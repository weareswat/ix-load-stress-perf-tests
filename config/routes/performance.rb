namespace :performance do
  namespace :api do
    ##### change-state ####
    put 'change_state/settings.json', to: 'change_state#settings'
    post 'change_state/scenario.json', to: 'change_state#create_scenario'
    delete 'change_state/scenario.json', to: 'change_state#destroy_scenario'

    # Simple n (default=10) concurrent requests scenario
    post 'change_state/concurrent.json', to: 'change_state#concurrent'

    #### create ###
    put 'create/settings.json', to: 'create#settings'
    post 'create/scenario.json', to: 'create#create_scenario'
    delete 'create/scenario.json', to: 'create#destroy_scenario'

    # Simple n (default=10) concurrent requests scenario
    post 'create/sequential/proprietary_uid.json', to: 'create#sequential_proprietary_uid'
  end
end