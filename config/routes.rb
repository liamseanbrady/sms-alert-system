SmsAlertSystem::Application.routes.draw do
  root to: 'users#new'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, except: [:new, :destroy]
  resources :tasks, only: [:index] do
    member do
      post :completed
    end
  end
  resources :alerts, only: [:index, :new, :create]
  resources :phrases, except: [:show]

  get '/records/:id', to: 'records#generate', as: 'generate_record'
end
