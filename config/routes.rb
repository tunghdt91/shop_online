ShopOnline::Application.routes.draw do
  get "static_pages/home"

  get "static_pages/help"

  resources :carts
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :products
  resources :categories
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :orders
  resources :relationships, only: [:create, :destroy]
  resources :product_orders
  resources :manufacturers
  resources :product_microposts, only: [:create, :destroy]
  root to: 'products#index'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/napthe', to: 'users#napthe'
  match '/addpoint', to: 'users#addpoint'
  match '/nt', to: 'users#nt'

  #product
  match '/allproducts', to: 'products#index'
  match '/price_by_asc' , to: 'products#price_by_asc'
  match '/price_by_desc', to: 'products#price_by_desc'
  match '/newupdate',   to: 'products#newupdate'
  match '/comment',   to: 'products#comment'
  #carts
  match '/mycarts', to: 'carts#mycarts', as: 'mycarts'
  match '/add_to_carts/:id', to:'carts#add_to_carts', as: 'add_to_carts', via: :post
  match '/delcart' , to: 'carts#destroy', via: :delete
  #categories
  match '/newcategory', to: 'categories#new'
  match '/allcategory', to: 'categories#index'

  #manuafactorers
  match '/new_manufacturer' ,  to:'manuafactorers#new'
  #staticpage
  match '/home', to: 'static_pages#home'
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
