Amplifyre::Application.routes.draw do

  # Band site based on subdomain
  constraints Subdomain do
    match '/edit(/:page)' => 'band_sites#edit_mode', :format => false
    match '/:page' => 'band_sites#live', :format => false
    root :to => 'band_sites#live', :format => false
  end

  scope '/api/v1', :format => false do
    resources :band_sites, :except => [:index, :new, :edit] do
      resources :socials, :except => [:index, :new, :edit]
      resources :albums, :except => [:index, :new, :edit] do
        collection do
          put 'reorder', :format => false
        end
      end
      resources :tracks, :except => [:index, :new, :edit]
      resources :photos, :except => [:index, :new, :edit]
      resources :posts, :except => [:index, :new, :edit]
      resources :concerts, :except => [:index, :new, :edit]
      resources :pages, :except => [:index, :new, :edit] do
        collection do
          put 'reorder', :format => false
        end
      end
    end
  end

  resources :band_sites, :except => [:index, :edit], :format => false

  # Static pages
  root :to => 'statics#prelaunch', :format => false
  post '/subscribe' => 'statics#subscribe', :format => false
  match '/examples' => 'statics#examples', :format => false

  # User dashboard
  match '/dashboard' => 'users#dashboard', :as => :user_root, :format => false

  # Site dashboard
  match '/:slug/dashboard' => 'band_sites#dashboard', :as => :band_site_dashboard, :format => false

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
