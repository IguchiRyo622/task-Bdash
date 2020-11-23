Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams do
    resources :lists, only: [:index, :new, :create, :show, :edit, :update] do
      resources :tasks, only: [:index, :new, :create]
    end
  end
end
