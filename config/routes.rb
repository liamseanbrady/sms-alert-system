SmsAlertSystem::Application.routes.draw do
  root to: 'users#new'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, except: [:new, :destroy, :index]
  resources :tasks, only: [:show]
  resources :alerts, only: [:index, :new, :create]
  resources :phrases, except: [:show]
end
