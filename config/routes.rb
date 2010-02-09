ActionController::Routing::Routes.draw do |map|
  # -- item
  map.resources :items
  # provides expense_path, etc. which is equal to items_path 
  map.resources :expenses, :as => :items
  map.resources :incomes, :as => :items
  map.resources :moves, :as => :items

  map.create_item 'items.:format',
    :controller => :items, :action => :create,
    :conditions => {:method => :post}
  map.update_item 'items/:id/update.:format',
    :controller => :items, :action => :update
  map.destroy_item 'items/:id/destroy.:format',
    :controller => :items, :action => :destroy

  # -- category
  map.resources :categories
  map.move_up_category 'categories/:id/move_up',
    :controller => :categories, :action => :move_up
  map.move_down_category 'categories/:id/move_down',
    :controller => :categories, :action => :move_down

  # -- account
  map.resources :accounts
  map.move_up_account 'accounts/:id/move_up',
    :controller => :accounts, :action => :move_up
  map.move_down_account 'accounts/:id/move_down',
    :controller => :accounts, :action => :move_down

  # -- log
  map.show_logs 'logs/:year/:month',
    :controller => :logs, :action => 'view', :mode => :show
  map.edit_logs 'logs/:year/:month/edit',
    :controller => :logs, :action => 'view', :mode => :edit

  # -- statistics
  map.show_month_stats 'stats/:year/:month',
    :controller => :stats, :action => 'month'
  map.show_year_stats 'stats/:year',
    :controller => :stats, :action => 'year'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  map.root :controller => :home

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
