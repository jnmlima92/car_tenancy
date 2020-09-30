Rails.application.routes.draw do
  resources :tenancies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root "cars#index"
  
  resources :cars
  get 'manufacturers', to: 'cars#manufacturers', as: 'manufacturers'
  get 'models',        to: 'cars#models',        as: 'models'
end
