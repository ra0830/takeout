Rails.application.routes.draw do
  get 'top' => 'home#top'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'home#top'

  resources :shops do
    resources :comments
    post :confirm, on: :collection
  end
  resources :favorites, only: [:create, :destroy, :index]
  resources :rates, only: [:create, :destroy]
end
