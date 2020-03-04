Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resource	:book_comments, only: [:create, :destroy]
    resource	:favorites, 	only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit,  :update, :index, :create] do
  	member do
  		get :following, :followers
  	end
  end

  resources :relationships, only: [:create, :destroy]

  root 'home#top'
  get 'home/about' => "home#about"

  post '' => "search#index"
end