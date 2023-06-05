Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users

  resources :users, only: [:index] do
    resources :foods, only: [:index] do
      resources :recpie_foods, only: [:index]
    end
    resources :recipes, only: [:index, :show] do
      resources :recpie_foods, only: [:index]
    end
  end
  
  root "users#index"

end
