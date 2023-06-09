Rails.application.routes.draw do
  get 'recipe_foods/new'
  get 'recipe_foods/edit'
  get 'users/index'
  get 'recipes/index'
  get '/public_recipes', to: 'recipes#public_recipe'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users

  resources :users
  resources :foods, only: [:index, :new, :create, :destroy]
    
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :public_recipes, only: [:index, :show]
  
  root "foods#index"

end
