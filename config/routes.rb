Rails.application.routes.draw do
  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'sessions#index'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/login', to: 'sessions#destroy'
  get '/login', to: 'sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
