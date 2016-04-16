Rails.application.routes.draw do

  root	  'users#index'

  # login
  post	  'auth/' 		          => 'tokens#validate'

  # users
  post	  'users' 		          => 'users#create'
  get	    'users/:id' 		      => 'users#show'
  get     'users/for/:id/search/:query',
                            :to => 'users#search_users', :constraints => {:query => /.*/}

  #posts
  post	  'posts' 		          => 'posts#create'
  get	    'posts' 		          => 'posts#index' # TODO: DELETE FOR SECURITY!
  get	    'posts/:id' 		      => 'posts#show'  # TODO: DELETE FOR SECURITY!
  get     'posts/privacy/by/:by_user_id/for/:for_user_id',
                            :to => 'posts#user_privacy'
  get     'posts/by/:by_user_id/for/:for_user_id(/before/:date)',
                            :to => 'posts#by_user', :constraints => {:date => /\d{4}-\d{2}-\d{2}%20\d{2}:\d{2}:\d{2}[.][0-9]+/}
  get     'posts/for/:user_id(/before/:date)',  
                            :to => 'posts#for_user_before', :constraints => {:date => /\d{4}-\d{2}-\d{2}%20\d{2}:\d{2}:\d{2}[.][0-9]+/}
  get     'posts/for/:user_id/since/:date',  
                            :to => 'posts#for_user_since', :constraints => {:date => /\d{4}-\d{2}-\d{2}%20\d{2}:\d{2}:\d{2}[.][0-9]+/}
  get     'posts/for/:user_id/at/:lat/:lng', 
                            :to => 'posts#for_user_at_location', :constraints => {:lat => /\-?\d+(.\d+)?/, :lng => /\-?\d+(.\d+)?/}
  get     'posts/count/by/:user_id/',
                            :to => 'posts#by_user_count' 

  # comments
  post 	  'comments' 		        => 'comments#create'

  # likes
  post 	  'likes' 		          => 'likes#create'
  delete  'likes/:id' 		      => 'likes#delete'

  # follows & follow requests
  post	  'follows/request/'	  => 'follow_requests#create'
  post	  'follows/accept/:id'	=> 'follow_requests#accept'
  delete  'follows/refuse/:id'	=> 'follow_requests#delete'
  delete  'follows/:id'		      => 'follows#delete'
  get     'follows/count/in/:user_id/' => 'follows#follows_count_in'
  get     'follows/count/out/:user_id/' => 'follows#follows_count_out'

end
