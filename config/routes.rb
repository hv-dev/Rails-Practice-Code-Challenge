Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :destinations
  resources :posts
  
  

  get "signup" => "users#new"
  get "signin" => "sessions#new"
  resource :session, only: [:new, :create, :destroy]
end
