Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  root 'users#show'
  resources :users, only: [:index, :show]
  resources :food_preps
  resources :labels
  resources :select_food_preps do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :groups do
    resources :group_users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
