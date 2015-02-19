SmsAlertSystem::Application.routes.draw do
  root to: 'users#new'

  get 'register', to: 'users#new', as: 'register'

  resources :users, except: [:new, :destroy, :index]
end
