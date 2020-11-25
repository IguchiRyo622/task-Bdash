Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams do
    resources :lists do
      resources :tasks
    end
  end
end
