Rails.application.routes.draw do

  get 'comments/new'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :defined_words, only: [:new, :create] do
    resources :votes, only: [:create]
    resources :comments, only: [:index, :new, :create]
  end

  resources :users, only: [] do
    resources :defined_words, only: [:index]
  end

  resources :comments, only: [] do
    resources :comments, only: [:new, :create]
  end

  resources :origins, only: [:index] do
    resources :defined_words, only: [:index]
  end

  root 'index#index'
end
