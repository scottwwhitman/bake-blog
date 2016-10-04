Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  get '/signup', to: 'users#new', as: 'new_user'

  post '/users', to: 'users#create'

  # show login form
  get '/login', to: 'sessions#new'
  # actually update session
  post '/sessions', to: 'sessions#create'  # or post /login
  # set up for log out links
  get '/logout', to: 'sessions#destroy'
end
