Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # resources :bookings do
  #   resources :reviews, only: [:create]
  # end

  # resources :chefs do
  #   resources :menus, except: [:show]
  # end

  # resources :reviews,  only: [:edit, :update, :destroy]

  resources :users, only: [:index, :show] do
    resources :menus, only: [:new, :edit, :create, :update, :destroy]
  end

  resources :menus, only: [:index, :show] do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end

  resources :bookings, only: [:index, :update]

  resources :reviews, only: [:create]
end
