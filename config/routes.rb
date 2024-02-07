Rails.application.routes.draw do
  devise_for :users

  resources :recipes, only: [:index, :new, :create, :show, :update, :destroy] do
    resources :recipe_foods
  end
 
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :shopping_lists, only: [:index]

  resources :shopping_lists, only: [:index]
end
