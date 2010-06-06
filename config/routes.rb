JoysCakes::Application.routes.draw do |map|
  resources :pictures


  root :to => 'content#index'

  match '/about'   => 'content#about',    :as => :about
  match '/contact' => 'content#contact', :as => :contact

  match '/gallery'   => 'pictures#gallery',   :as => :gallery
  match '/flavors'   => 'pictures#flavors',   :as => :flavors
  match '/birthdays' => 'pictures#birthdays', :as => :birthdays
  match '/weddings'  => 'pictures#weddings',  :as => :weddings
  match '/others'    => 'pictures#others',    :as => :others

  match '/contact_submit' => 'content#contact_submit', :as => :contact_submit

  # map.about     '/about',     :controller => "content", :action => "about"
  # map.contact   '/contact',   :controller => "content", :action => "contact"
  #
  # map.gallery   '/gallery',   :controller => "pictures", :action => "gallery"
  # map.flavors   '/flavors',   :controller => "pictures", :action => "flavors"
  # map.birthdays '/birthdays', :controller => "pictures", :action => "birthdays"
  # map.weddings  '/weddings',  :controller => "pictures", :action => "weddings"
  # map.others    '/others',    :controller => "pictures", :action => "others"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
