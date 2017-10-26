Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  devise_scope :user do
    unauthenticated :user do
      root to: 'devise/sessions#new'
    end
    authenticated :user do
      root to: 'dashboard#index'
    end
  end
  resources :users
  resources :recipients
end
