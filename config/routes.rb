Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  resource :favorites, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'
end