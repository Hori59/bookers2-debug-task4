Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers
    end
  end

  resources :books do
    resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:destroy]
  post 'relationships/:id' => 'relationship#create'

  root 'home#top'
  get 'home/about'
end