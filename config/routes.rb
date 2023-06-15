Rails.application.routes.draw do
  devise_for :users

  resources :bills do
    resources :payments, only: [:new, :create]
  end

  root to: 'bills#index'
end
