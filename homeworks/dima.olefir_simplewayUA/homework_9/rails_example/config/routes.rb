Rails.application.routes.draw do

  resource :users
  resource :posts

  root 'users#index'

  get '/users/new'
  post '/users/new'

  get '/users/login'
  post '/users/login'

  get 'users/index'

  get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
