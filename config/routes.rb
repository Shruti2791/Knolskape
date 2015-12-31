Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [] do
    get :photos, on: :member
    resources :friends, only: [] do
      get :photos, on: :collection
    end
  end
end
