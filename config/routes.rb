Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/camels', to: 'camels#index'
  get '/camels/new', to: 'camels#new'
  post '/camels', to: 'camels#create'
  get '/camels/:id', to: 'camels#show'
  get '/camels/:id/edit', to: 'camels#edit'
  get '/camels/:id', to: 'camels#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
