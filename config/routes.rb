Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  get '/dashboard', to: 'dashboard#index'
end
