Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "destinations#index"

  get "bloggers/filter/:filter" => "bloggers#index", as: :filtered_bloggers
  get "destinations/filter/:filter" => "destinations#index", as: :filtered_destinations
  get "posts/filter/:filter" => "posts#index", as: :filtered_posts

  resources :bloggers
  resources :destinations
  resources :posts

  get "signup" => "users#new"
  get "signin" => "sessions#new"
  resource :session, only: [:new, :create, :destroy]
end
