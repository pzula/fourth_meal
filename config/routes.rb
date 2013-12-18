require 'resque/server'

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
  resources :hours
  resources :restaurant_employees
  resources :locations
  resources :order_restaurants
  root to: 'static_pages#home'

  get "orders/guest_checkout"

  get "approve/:id" => "restaurants#approve", as: 'approve'
  get "restaurant-dashboard/:id" => "restaurants#restaurant_dashboard", as: 'restaurant_dashboard'

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

  get "past_orders/:unique_url" => "orders#guest_order_receipt", as: "past_orders"
  mount Resque::Server.new, at: "/resque"
end
