Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'shops#index'

  resources :shops do
    resources :comments
    collection do
      post :confirm
    end
  end
end
