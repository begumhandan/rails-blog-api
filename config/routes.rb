Rails.application.routes.draw do
  get "pages/home"
  get "home/index"
  # Ana sayfa
  root "pages#home"

  # API routes
  namespace :api do
    namespace :v1 do
      # Authentication (sonra ekleyeceğiz)
      post "login", to: "authentication#login"

      # Resources
      resources :users do
        resources :posts, only: [ :index ]
      end

      resources :categories do
        resources :posts, only: [ :index ]
      end

      resources :posts do
        resources :comments, only: [ :index, :create ]
      end

      resources :comments

      resources :tags do
        resources :posts, only: [ :index ]
      end
    end
  end
end
