Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "teams#index"
  resources :teams do
    resources :lists do
      resources :tasks
    end
  end
  resources :users, only: :show
end
