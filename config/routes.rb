ActionController::Routing::Routes.draw do |map|
  map.resources :rooms, :has_many => :messages
  
  # map.root :controller => "home"
  map.root :rooms
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'  
end
