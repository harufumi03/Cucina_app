Rails.application.routes.draw do
  get 'select_food_preps/index'
  get 'select_food_preps/new'
  get 'select_food_preps/create'
  get 'select_food_preps/destroy'
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
