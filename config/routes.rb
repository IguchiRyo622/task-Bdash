Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams, only: [:new, :create] do
    resources :lists, only: [:index, :new, :create]
  end
end
