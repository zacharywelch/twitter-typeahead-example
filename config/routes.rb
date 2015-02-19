TwitterTypeahead::Application.routes.draw do
  resources :search
  resources :products
  resources :users
  resources :query
  root 'search#index'
end
