Rails.application.routes.draw do

  root	  'users#index'

  post	  'auth/' 		          => 'tokens#validate'

  get	    'users/:id' 		      => 'users#show'#, as: :user
  post	  'users' 		          => 'users#create'
  get     'users/for/:id/search/:query',
                            :to => 'users#search_users', :constraints => {:query => /.*/}

  #get	  'posts/:id' 		      => 'posts#show', as: :post
  get	    'posts' 		          => 'posts#index'
  get	    'posts/:id' 		      => 'posts#show'
  get     'posts/by/:user_id'   => 'posts#by_user'
  get     'posts/for/:user_id'  => 'posts#for_user'
  post	  'posts' 		          => 'posts#create'

  get     'posts/for/:user_id/at/:lat/:lng', 
                            :to => 'posts#for_user_at_location', :constraints => {:lat => /\-?\d+(.\d+)?/, :lng => /\-?\d+(.\d+)?/}

  post 	  'comments' 		        => 'comments#create'

  post 	  'likes' 		          => 'likes#create'
  delete  'likes/:id' 		      => 'likes#delete'

  post	  'follows/request/'	  => 'follow_requests#create'
  post	  'follows/accept/:id'	=> 'follow_requests#accept'
  delete  'follows/refuse/:id'	=> 'follow_requests#delete'
  delete  'follows/:id'		      => 'follows#delete'

  #get 'likes' => 'likes#index'

  #get 'auth/' => 'users#validate'

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
