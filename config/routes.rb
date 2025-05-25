# Notes: `namespace` creates a URL prefix and a module namespace
# 1. It automatically prefixes all paths with `/admin`
# 2. Tells Rails to look in the admin/ folder for:
#   Controllers (app/controllers/admin/...)
#   Views (app/views/admin/...)
# 3. It also prefixes your path helpers (e.g., admin_login_path, admin_admins_path)

Rails.application.routes.draw do
  # Public-Facing Storefront routes
  # Root path `/`
  namespace :storefront do
  root to: "storefront/home#index"

    # get "/products",     to: "storefront/products#index"
    # get "/products/:id", to: "storefront/products#show"
    # get "/about",        to: "storefront/pages#about"
  end


  # Administration Portal routes
  # Root path [/admin]
  # Layout file: `app/views/layouts/admin.html.erb`
  # Controllers Ex. [Admin::DashboardController, Admin::SessionsController, Admin::AdminsController]
  namespace :admin do
    root "home#index"

    # Admin Login/Logout routes
    get    "/login",  to: "sessions#new"         # Show login form
    post   "/login",  to: "sessions#create"      # Handle login submission
    delete "/logout", to: "sessions#destroy"     # Process logout

    # Admin CRUD routes
    # resources :admins, only: [ :index, :new, :create, :destroy ]
    get    "/admins",          to: "admins#index",   as: :admins
    get    "/admins/new",      to: "admins#new",     as: :new_admin
    post   "/admins",          to: "admins#create"
    delete "/admins/:id",      to: "admins#destroy", as: :admin

    # Category CRUD routes
    # resources :categories

    # Product CRUD routes
    # resources :products

    # Order CRUD routes
    # resources :orders
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # More resources will go here in the future:
  # resources :categories
  # resources :products


  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
