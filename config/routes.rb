Rails.application.routes.draw do
  get 'events/new', to: 'events#new'
  post 'events/new', to: 'events#create'
  get 'events/:id/show', to: 'events#show'
  get 'events/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
end
