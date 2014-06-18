Rails.application.routes.draw do
  devise_for :users
 
  root 'welcome#index'

  resources :farms, only: [:show, :new, :create, :edit, :update]
  get "/farms/:id/followers" => "farms#followers"
  get "/search" => "farms#search"

  resources :links, only: [:destroy, :create, :edit, :update]
  resources :comments, only: [:destroy, :create]
  resources :ratings, only: [:create]
  resources :connections, only: [:create, :destroy]
  resources :users, only: [:show]

  
 
end
