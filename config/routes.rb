Rails.application.routes.draw do
  
  resources :orders do
    resources :payment_methods, only: [:new, :create]
  end
  
  resources :carts, only: [:index] do
    member do
      delete :delete_from_cart
      post :add_to_cart
    end
  end

  resources :products, only: [:show, :index]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
