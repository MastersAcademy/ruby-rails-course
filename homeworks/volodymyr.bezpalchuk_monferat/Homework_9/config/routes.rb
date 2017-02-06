Rails.application.routes.draw do

  get 'sessions/login'
  get 'sessions/logout'
  post 'sessions' => 'sessions#create'

  resources :posts

  root 'welcome#index'

  get 'users/new' => 'users#new'
  post 'users' => 'users#create'

end
