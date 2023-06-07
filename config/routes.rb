Rails.application.routes.draw do
  get 'users/index'
  get 'recipes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users

  resources :users
  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
  end
  resources :recpie_foods, only: [:index]
  resources :public_recipes, only: [:index, :show]
  
  root "foods#index"

end
