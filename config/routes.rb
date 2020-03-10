Rails.application.routes.draw do
  get 'rooms/show'
  get 'chat/show'
  get 'chat/show' => "chat#show"
  resources :maps, only: [:index]
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :books do
    resource	:book_comments, only: [:create, :destroy]
    resource	:favorites, 	only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit,  :update, :index] do
  	member do
  		get :following, :followers
  	end
  end

  resources :relationships, only: [:create, :destroy]

  root 'home#top'
  get 'home/about' => "home#about"
  get 'search/result' => "search#result"

end