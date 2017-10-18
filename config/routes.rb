Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :defined_words, only: [:new, :create] do
    resources :votes, only: [:create]
  end

  resources :comments, only: [:new, :create] do
    resources :votes, only: [:create]
  end

  resources :users, only: [] do
    resources :defined_words, only: [:index]
  end

  root 'index#index'
end
