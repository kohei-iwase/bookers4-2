Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit,  :update, :index, :create]
  root 'home#top'
  get 'home/about' => "home#about"
end