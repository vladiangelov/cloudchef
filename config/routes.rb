Rails.application.routes.draw do
  devise_for :users
  root to: 'meals#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :bookings, only: [ :index, :new, :create ]
  end
  resources :bookings, only: [ :show, :edit, :update, :destroy ]
end
