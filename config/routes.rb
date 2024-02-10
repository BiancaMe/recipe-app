Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/public_recipes', to:'recipes#public_recipes', as: :public_recipes


  resources :recipes, only: [:create, :index, :destroy, :show, :new, :update] do 
    member do
      patch 'update_privacy', to: 'recipes#update_privacy', as: 'update_recipe_privacy'
      get '/shopping_list', to:'recipes#shopping_list', as: :shopping_list
    end
  end

  resources :recipe_foods, only: [:new, :create, :destroy]

  resources :inventories, only: [:create, :index, :show, :destroy, :new] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end

  resources :inventory_foods do
    delete 'remove_food', on: :member
  end

  resources :foods, only: [:index, :create, :destroy, :new]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "recipes#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
