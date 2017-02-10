Rails.application.routes.draw do
  resources :users

  root to: 'sessions#new'

  resources :users do
    resources :posts
  end

  resources :sessions, only: [:new, :create, :destroy]
  
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
