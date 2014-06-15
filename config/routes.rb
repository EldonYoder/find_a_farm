Rails.application.routes.draw do
  devise_for :users
 
  root 'welcome#index'

  resources :farms
  resources :links
  resources :comments
  resources :ratings
  resources :connections
  resources :users

  get "/farms/:id/followers" => "farms#followers"

  get "/search" => "farms#search"
 
end
