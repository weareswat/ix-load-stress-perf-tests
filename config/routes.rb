Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  Pathname.new(Rails.root.join('config/routes/')).each_child do |route|
    instance_eval File.read route
  end
end
