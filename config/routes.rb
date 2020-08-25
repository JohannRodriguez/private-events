Rails.application.routes.draw do
  resources :events, only: [:new, :create, :show, :index]
  post 'events/new', to: 'events#create'
  resources :users, only: [:new, :create, :show]
  post 'users/new', to: 'users#create'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get 'sessions/logout', to: 'sessions#destroy', as: :sessions_destroy
  get 'invitation', to: 'invitations#create', as: :invitation
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'
end
