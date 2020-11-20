Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams, only: [:new, :create, :show] do
    resources :lists, only: [:index, :new, :create]
  end
end
