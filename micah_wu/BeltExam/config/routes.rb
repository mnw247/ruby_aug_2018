Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :songs
  post '/sessions' => "sessions#create"
  delete '/sessions/:id' => "sessions#destroy"
  post '/songs/:id/add' => "songs#add"
  
end
