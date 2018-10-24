Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'shops#index'

  resources :shops do
    resources :comments
    post :confirm, on: :collection
  end
end
