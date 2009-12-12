ActionController::Routing::Routes.draw do |map|

  map.with_options :controller => 'juggernaut', :conditions => { :method => :post } do |j|
    j.juggernaut_login 'juggernaut/login', :action  => 'login'
    j.juggernaut_connection_logout 'juggernaut/connection_logout', :action  => 'connection_logout'
    j.juggernaut_users 'juggernaut/users', :action  => 'users'
    j.juggernaut_logout 'juggernaut/logout', :action  => 'logout'
  end

  map.resource :user_session
  map.resources :rooms, :has_many => :messages
  map.resource :account, :controller => "users"
  map.resource :settings
  map.resources :users
  map.root :rooms
  # map.root :controller => "user_sessions", :action => "new"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'  
end
