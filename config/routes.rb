ActionController::Routing::Routes.draw do |map|
  map.resources :rooms

  map.resources :chat_rooms, :has_many => :messages
  
  map.root :controller => "home"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'  
end
