namespace :performance do
  namespace :api do
    put 'change_state/settings.json', to: 'change_state#settings'
    post 'change_state/scenario.json', to: 'change_state#create_scenario'
    delete 'change_state/scenario.json', to: 'change_state#destroy_scenario'

    # Simple n (default=10) concurrent requests scenario
    post 'change_state/concurrent.json', to: 'change_state#concurrent'
  end
end