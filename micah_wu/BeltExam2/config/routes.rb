Rails.application.routes.draw do
  root 'users#index'
  resources :users
  get '/bright_ideas' => "posts#index"
  resources :posts
  resources :likes
  post '/sessions' => "sessions#create"
  delete '/sessions/:id' => "sessions#destroy"
end
