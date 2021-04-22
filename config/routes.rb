Rails.application.routes.draw do
  resources :meters, except: [:edit]
  devise_for :employees

  root 'meters#index'
end
