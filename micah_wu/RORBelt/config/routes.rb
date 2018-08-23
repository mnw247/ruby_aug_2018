Rails.application.routes.draw do
  # get 'playlists/new'

  # get 'playlists/create'

  # get 'songs/new'

  # get 'songs/create'

  # get 'users/new'

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'
  get '/main' => 'users#index'
  patch '/playlists/:song_id/update' => 'playlists#update'
  get '/songs/:id' => 'songs#show_song'
  get '/users/:id' => 'users#show'
  resource :users
  resource :songs
  resource :sessions

  #        main GET    /main(.:format)          users#index
  #       users POST   /users(.:format)         users#create
  #   new_users GET    /users/new(.:format)     users#new
  #  edit_users GET    /users/edit(.:format)    users#edit
  #             GET    /users(.:format)         users#show
  #             PATCH  /users(.:format)         users#update
  #             PUT    /users(.:format)         users#update
  #             DELETE /users(.:format)         users#destroy
  #       songs POST   /songs(.:format)         songs#create
  #   new_songs GET    /songs/new(.:format)     songs#new
  #  edit_songs GET    /songs/edit(.:format)    songs#edit
  #             GET    /songs(.:format)         songs#show
  #             PATCH  /songs(.:format)         songs#update
  #             PUT    /songs(.:format)         songs#update
  #             DELETE /songs(.:format)         songs#destroy
  #    sessions POST   /sessions(.:format)      sessions#create
#  new_sessions GET    /sessions/new(.:format)  sessions#new
# edit_sessions GET    /sessions/edit(.:format) sessions#edit
#               GET    /sessions(.:format)      sessions#show
#               PATCH  /sessions(.:format)      sessions#update
#               PUT    /sessions(.:format)      sessions#update
#               DELETE /sessions(.:format)      sessions#destroy
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
