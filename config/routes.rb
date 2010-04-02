ActionController::Routing::Routes.draw do |map|
  map.resource :account, :controller => "users"
  map.login "login", :controller => "user_sessions", :action => "new"
  map.authenticate "authenticate", :controller => "user_sessions", :action => "create"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.resources :photos, :collection => { :untouched => :get, :edit_multiple => :post, :update_multiple => :put, :upload => :get, :scan => :get }
  map.resources :albums, :collection => { :untouched => :get, } do |album|
    album.resources :tags do |tag|
      tag.resources :photos, :collection => { :untouched => :get, :upload => :get, :edit_multiple => :get }
    end
    album.resources :photos, :collection => { :untouched => :get, :upload => :get, :edit_multiple => :get }
  end
  map.resources :collections do |collection|
    collection.resources :albums do |album|
      album.resources :photos, :collection => { :untouched => :get }
      #album.resources :photos, :collection => { :untouched => :get, :upload => :get, :edit_multiple => :get }
    end
  end
  
  map.resources :tags, :has_many => [ :photos, :albums ], :shallow => true
  
  map.resources :users, :controller => "admin/users"

  map.stream '/stream', :controller => 'stream'

  map.root :controller => "collections"

end