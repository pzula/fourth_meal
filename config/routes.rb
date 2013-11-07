DinnerDash::Application.routes.draw do

  resources :items
  resources :orders
  resources :order_items
  root to: 'items#index'

  post "items/add_to_order/:id" => 'items#add_to_order', as: 'add_item'
end
