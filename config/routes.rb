Rails.application.routes.draw do
  resources :users

  root 'pages#home'

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy", as: 'logout'

end
