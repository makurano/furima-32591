Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :sold_items, only: [:index, :create]
  end
  root to: "items#index"
end
