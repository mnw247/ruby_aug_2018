Rails.application.routes.draw do
  root "users#index"
  get '/users/new' => 'users#new'
  get '/users/experience' => 'users#experience'

end
