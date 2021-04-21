Rails.application.routes.draw do
  resources :meters
  devise_for :employees

  devise_scope :employee do
    authenticated :employee do
      root 'meters#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
