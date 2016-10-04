TwitterTypeahead::Application.routes.draw do
  resources :characters do
    get 'search', on: :collection
  end

  resources :search, only: [:index]
  resources :filter, only: [:index]
  resources :paginate, only: [:index]
  root 'search#index'
end
