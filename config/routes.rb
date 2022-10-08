Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :games do
    resources :bookings, only: [:new, :create]
  end
  resources :categories, only: [:show, :index]
  resources :bookings, except: [:new, :create]
end
