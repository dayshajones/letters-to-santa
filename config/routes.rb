Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#home"

  get "/signup" => "users#new"
  post "/signup" => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"

  delete "/logout" => "sessions#logout"

  get '/auth/:provider/callback' => "sessions#omniauth"
  
  resources :users
  resources :letters

  resources :elves do
    resources :letters, only: [:new, :index, :create]
  end
end
