Rails.application.routes.draw do
  resources :inventories
  resources :items
  get 'main/login'
  post 'main/create'
  get 'main/destroy'
  get 'main/user_item'
  get 'shop/:id', to: "main#shop"
  resources :users
  get 'shop/buy/:item_id/:shop_id', to: "main#buy"
  get 'main/inventories'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
