Rails.application.routes.draw do
  devise_for :users
  get "tasks/index"
  root to: "tasks#index" 
  resources :tasks, only: [:index, :create, :destroy]
  resources :profiles, only: [:index, :create, :edit, :update]
end
