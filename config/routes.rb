Amplifyre::Application.routes.draw do

  match '*all' => 'application#cors', :constraints => {:method => 'OPTIONS'}

  # Band site based on subdomain
  constraints Subdomain do
    match '/edit(/:page)' => 'band_sites#edit_mode'
    match '/:page' => 'band_sites#live'
    root :to => 'band_sites#live'
  end

  resources :band_sites, :except => [:index, :show, :edit] do
    resources :socials, :format => false
    resources :albums, :format => false
    resources :tracks, :format => false
    resources :photos, :format => false
    resources :posts, :format => false
    resources :concerts, :format => false
    resources :pages, :format => false
  end

  # Static pages
  root :to => 'statics#home'
  match '/examples' => 'statics#examples'

  # User dashboard
  match '/dashboard' => 'users#dashboard', :as => :user_root

  # Site dashboard
  match '/:slug/dashboard' => 'band_sites#dashboard', :as => :band_site_dashboard

  # ActiveAdmin
  ActiveAdmin.routes(self)

  # Devise
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

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
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
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
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with 'rake routes'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end
