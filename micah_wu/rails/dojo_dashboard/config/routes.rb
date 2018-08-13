Rails.application.routes.draw do

  root 'dojos#index'
  # get 'dojos' => 'dojos#index'
  # get 'dojos/new' => 'dojos#new'
  # post 'dojos/create' => 'dojos#create'
  # post 'dojos/delete/:id' => 'dojos#delete'
  # get 'dojos/:id' => 'dojos#show'
  # get 'dojos/:id/edit' => 'dojos#edit'
  # patch 'dojos/:id' => 'dojos#update'
  resources :dojos do
    resources :students
  end


end