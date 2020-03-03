Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resource	:book_comments, only: [:create, :destroy]
    resource	:favorites, 	only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit,  :update, :index, :create]

  root 'home#top'
  get 'home/about' => "home#about"
end