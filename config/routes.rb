Rails.application.routes.draw do
  get "tasks/index"
  root to: "tasks#index" 
  resources :tasks, only: :index
end
