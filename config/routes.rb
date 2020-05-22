Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get '/sign_in', to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
