Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants do
    collection do
      get :top
    end

    member do
      get :chef
    end
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: %i[destroy]
end
