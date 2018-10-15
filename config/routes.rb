Rails.application.routes.draw do
  resources :shops do
    collection do
      post :confirm
    end
  end
end
