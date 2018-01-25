Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :motels do
    resources :rooms, only: [:index, :show]
    resources :bookings, only: [:index, :show]
  end


  root to: 'pages#home'
end
