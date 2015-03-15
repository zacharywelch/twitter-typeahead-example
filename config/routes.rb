TwitterTypeahead::Application.routes.draw do
  resources :users

  resources :characters do
    get 'search', on: :collection
  end

  resources :search, only: [:index]
  root 'search#index'
end
