# Rails.application.routes.draw do
  
#   namespace :api do
#     namespace :v1 do
#       get "tags/index"
#       get "tags/show"
#       get "tags/create"
#       get "tags/update"
#       get "tags/destroy"
#       get "comments/index"
#       get "comments/show"
#       get "comments/create"
#       get "comments/update"
#       get "comments/destroy"
#       get "posts/index"
#       get "posts/show"
#       get "posts/create"
#       get "posts/update"
#       get "posts/destroy"
#       get "categories/index"
#       get "categories/show"
#       get "categories/create"
#       get "categories/update"
#       get "categories/destroy"
#       get "users/index"
#       get "users/show"
#       get "users/create"
#       get "users/update"
#       get "users/destroy"
#     end
#   end
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   # root "posts#index"
# end
Rails.application.routes.draw do
root 'home#index'
get 'home/index'
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, only: [:index]
      end
      resources :categories do
        resources :posts, only: [:index]
      end
      resources :posts do
        resources :comments, only: [:index, :create]
      end
      resources :comments
      resources :tags do
        resources :posts, only: [:index]
      end
    end
  end
end
