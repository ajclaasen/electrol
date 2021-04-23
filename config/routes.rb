Rails.application.routes.draw do
  devise_for :users
  resources :meters, except: [:edit]

  root 'meters#index'
end
