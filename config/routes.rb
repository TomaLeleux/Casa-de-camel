Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :camels, except: [:destroy] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:create]
  end
  get '/bookings', to: 'bookings#index', as: 'bookings'
  get '/user', to: 'profile#show', as: 'user'
  get '/dashboard', to: 'profile#dashboard', as: 'dashboard'
  get '/bookings/:id/edit', to: 'bookings#edit', as: 'edit_booking'
  patch '/bookings/:id', to: 'bookings#update', as: 'booking'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
