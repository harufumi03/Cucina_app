Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  root 'users#index'
  resources :users, only: [:index, :show]
  resources :food_preps
  resources :labels
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
