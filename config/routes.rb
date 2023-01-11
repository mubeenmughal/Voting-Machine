# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users, only: [:show] do
    resources :candidateship, only: %i[new create index destroy update]
    resources :parties
  end
  namespace :candidate do
    resources :users, only: [:show]
  end
  namespace :admin do
    resources :users, only: [:index]
  end
  resources :pollings
  resources :votes, only: %i[index create]
  get '/result', to: 'home#result'
  resources :constituencies, except: %i[destroy]
  get '/filter_constituencies/:id', to: 'constituencies#filter_constituencies'
end
