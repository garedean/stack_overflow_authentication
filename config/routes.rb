Rails.application.routes.draw do

  root 'questions#index'

  resources :users, only: [:new, :create]

  resources :questions do
    resources :answers
  end

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy", as: 'logout'
end
