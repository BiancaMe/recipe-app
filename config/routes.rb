Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :inventories, only: [:create, :index, :show, :destroy, :new] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end

  resources :inventory_foods do
    delete 'remove_food', on: :member
  end

  resources :foods, only: [:index, :create, :destroy, :new]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root to: "recipes#index"

  get 'public_recipes', to: 'recipes#public_recipes'

  # Defines the root path route ("/")
  # root "posts#index"
end
