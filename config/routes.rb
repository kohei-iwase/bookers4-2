Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update,:create]
  resources :books
  root 'home#top'
  get 'home/about'
end