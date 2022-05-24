Rails.application.routes.draw do
  # get 'bookings/index'
  # get 'bookings/show'
  # get 'vans/index'
  # get 'vans/show'
  # get 'vans/new'
  # get 'vans/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vans, except: [ :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show]
  get 'booking/confirmation', to: 'bookings#confirmation', as: "confirm_booking"
end
