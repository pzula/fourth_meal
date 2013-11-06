DinnerDash::Application.routes.draw do

  resources :items
  resources :orders
  root to: 'items#index'

  post "item/add_to_order" => 'item#add_to_order', as: 'add_item'
end
