Rails.application.routes.draw do
  get 'users/show'

  get 'users/edit'

  get 'users/update'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :motels do
    resources :rooms, only: [:index, :show]
    resources :bookings, only: [:index, :show]
  end


  root to: 'pages#home'
end
