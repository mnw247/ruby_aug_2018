Rails.application.routes.draw do

  root 'users#new'
  resources :users 
  resources :events
  resources :sessions

  get "/attends/:user_id/events/:event_id" => "attends#create"
  get "/attends/:user_id/events/:event_id/destroy" => "attends#destroy"
  post "/comments/:user_id/events/:event_id" => "comments#create"


#   Prefix Verb   URI Pattern                  Controller#Action
#         root GET    /                            users#new
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#              DELETE /users/:id(.:format)         users#destroy
#       events GET    /events(.:format)            events#index
#              POST   /events(.:format)            events#create
#    new_event GET    /events/new(.:format)        events#new
#   edit_event GET    /events/:id/edit(.:format)   events#edit
#        event GET    /events/:id(.:format)        events#show
#              PATCH  /events/:id(.:format)        events#update
#              PUT    /events/:id(.:format)        events#update
#              DELETE /events/:id(.:format)        events#destroy
#     sessions GET    /sessions(.:format)          sessions#index
#              POST   /sessions(.:format)          sessions#create
#  new_session GET    /sessions/new(.:format)      sessions#new
# edit_session GET    /sessions/:id/edit(.:format) sessions#edit
#      session GET    /sessions/:id(.:format)      sessions#show
#              PATCH  /sessions/:id(.:format)      sessions#update
#              PUT    /sessions/:id(.:format)      sessions#update
#              DELETE /sessions/:id(.:format)      sessions#destroy

end
