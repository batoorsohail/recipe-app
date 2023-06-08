Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users

  resources :users
  resources :foods, only: [:index, :new, :create]
  resources :recipes, only: [:index, :show] do
    resources :recpie_foods, only: [:index]
  end
  resources :public_recipes, only: [:index, :show]
  
  root "foods#index"

end
