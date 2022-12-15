Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  root 'top#index'
  resources :users, only: [:index, :show]
  resources :food_preps do
    collection do
      get 'search'
    end
  end  
  resources :labels
  resources :select_food_preps do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :groups do
    resources :group_users
  end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
    # get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
