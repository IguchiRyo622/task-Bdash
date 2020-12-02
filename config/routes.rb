Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "teams#index"
  resources :teams do
    resources :lists do
      resources :tasks do
        resources :comments, only: :create
      end
    end
  end
  resources :users, only: :show
end
