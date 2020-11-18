Rails.application.routes.draw do
  get 'lists/index'
  devise_for :users
  root to: "lists#index"
  resources :teams, only: [:new, :create]
end
