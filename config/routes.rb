Rails.application.routes.draw do

  delete 'notifications/:id' => "notifications#destroy", as: "notifications"
  root to: 'portfolios#index'
  get "homes/about" => "homes#about"
  devise_for :admins
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :users
  resources :pf_reviews
  resources :portfolios
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]

  namespace :admin do
    resources :users,only: [:show, :index, :edit, :update, :destroy]
    resources :portfolios,only: [:show, :index, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
