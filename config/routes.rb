Rails.application.routes.draw do
  get 'users/create'
  get 'material', to: "material#show"
  get 'material/form'
  get 'material/form_source'
  get 'material/form_code'
  get 'material/form_builder'
  get 'material/params'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#tailwind'
  get 'shoelace', to: "home#shoelace"

  resources :users, only: :create
end
