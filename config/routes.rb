Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
   resources :orders, only: [:create, :index]
  end
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
  end
end