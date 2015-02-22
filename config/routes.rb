TwitterTypeahead::Application.routes.draw do
  resources :search
  resources :products
  resources :users
  resources :query
  resources :accounts
  root 'search#index'
end
