Rails.application.routes.draw do
  namespace :api do
    namespace :v2 do
      resources :dishwasher_turns, only: [:index, :show, :create]
    end
    namespace :v1 do
      resources :testruns, only: [:index, :show, :create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
