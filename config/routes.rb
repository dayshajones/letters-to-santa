Rails.application.routes.draw do
  root "sessions#home"
  get "/signup" => "users#new"
  post "/signup" => "users#create"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete "/logout" => "sessions#logout"
  get '/auth/:provider/callback' => "sessions#omniauth"
  
  resources :users
  resources :letters, only: [:index, :new, :create]

  resources :elves do
    resources :letters, shallow: true
  end
end
