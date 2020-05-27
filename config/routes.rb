Rails.application.routes.draw do
  get 'events/new', to: 'events#new'
  post 'events/new', to: 'events#create'
  get 'events/show/:id', to: 'events#show', as: :events_show
  get 'events/index'
  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create'
  get 'users/show'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
end
