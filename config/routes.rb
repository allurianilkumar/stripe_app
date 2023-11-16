Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # post "/webhooks/stripe", to: "webhooks#create"
  post "/webhooks/:source", to: "webhooks#create"


  # Defines the root path route ("/")
  #root "webhooks#create"
end
