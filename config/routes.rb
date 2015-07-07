Rails.application.routes.draw do

  root 'questions#index'

  resources :users

  resources :questions do
    resources :answers
  end

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy", as: 'logout'
  get "/admin" => "admins#index", as: 'admin'
  patch "/admin/:id" => "admins#update"
end
