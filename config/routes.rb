Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy]

  # resources :comments
  # resources :stories
  # resources :epics
  # resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
