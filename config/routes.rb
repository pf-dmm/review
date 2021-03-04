Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :admins
  devise_for :users
  resources :users
  resources :pf_reviews
  resources :portfolios
  
  namespace :admin do
    resources :users,only: [:show, :index, :edit, :update, :destroy]
    resources :portfolios,only: [:show, :index, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
