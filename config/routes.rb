Rails.application.routes.draw do
  devise_for :controllers
  devise_for :users
  root to: 'pages#home'
  # Devise
  resources :user
  resources :lender
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
