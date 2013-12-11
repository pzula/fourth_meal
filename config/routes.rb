DinnerDash::Application.routes.draw do

  resources :visitor_users

  resources :restaurants
  resources :items
  resources :orders
  resources :order_items
  resources :users
  resources :categories
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :charges
  resources :menus
  root to: 'static_pages#home'

  get "orders/guest_checkout"

  post "items/add_to_order/:id" => 'items#add_to_order', as: 'add_item'
  get "login" => "user_sessions#new"
  get "logout" => "user_sessions#destroy"

  get "checkout" => "orders#checkout", as: 'checkout'
  post "place_order" => "orders#place_order", as: 'place_order'

  #Section for singular checkout
  get "checkout_one" => "orders#checkout_one_restaurant", as: 'checkout_one_restaurant'
  post "place_order_one_restaurant" => "orders#place_order_one_restaurant", as: 'place_order_one_restaurant'


  get "dashboard" => "users#dashboard", as: 'dashboard'

  get "static_pages/home"



end
