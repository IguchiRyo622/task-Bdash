Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "teams#index"
  get 'items/:id', to: 'items#checked'
  resources :teams do
    resources :lists do
      resources :tasks do
        resources :items, only: [:create, :destroy]
        resources :comments, only: :create
      end
    end
  end
  resources :users, only: :show do
    collection do
      get 'search'
    end
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
end
