DinnerDash::Application.routes.draw do

  #resources :items
  resources :orders
  resources :order_items
  resources :users
  resources :categories
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :charges
  root to: 'static_pages#home'

  post "items/add_to_order/:id" => 'items#add_to_order', as: 'add_item'
  get "login" => "user_sessions#new"
  get "logout" => "user_sessions#destroy"

  get "checkout" => "orders#checkout", as: 'checkout'
  post "place_order" => "orders#place_order", as: 'place_order'

  get "dashboard" => "users#dashboard", as: 'dashboard'

  get "static_pages/home"

  get ":restaurant/menu" => "menus#index"

end
