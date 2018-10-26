Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'shops#index'

  resources :shops do
    resources :comments
    post :confirm, on: :collection
  end
  resources :favorites, only: [:create, :destroy, :index]
  resources :rates, only: [:create, :destroy]
end
