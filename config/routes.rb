DinnerDash::Application.routes.draw do

  resources :items
  resources :orders
  root to: 'items#index'

end
