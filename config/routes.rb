Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'events#index'
  resources :users, only: %i[index show]
  resources :events
  resources :events, only: %i[index show new create destroy] do
    member do
      post 'attend'
    end
  end
  # get 'events/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
