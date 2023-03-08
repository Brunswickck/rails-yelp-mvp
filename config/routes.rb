Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show, :create, :new] do

    resources :reviews, only: [:new, :create]

    collection do
      get :top
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
