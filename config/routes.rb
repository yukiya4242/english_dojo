Rails.application.routes.draw do
  root to: 'homes#top'
  resources :users,         only:[:index, :show, :create, :update, :destroy]
  resources :homes,         only:[:top, :about]
  resources :scores,        only:[:index, :show, :create, :update, :destroy]
  resources :questions,     only:[:index, :show]
  resources :answers,       only:[:create, :update]
  resources :relationships, only:[:create, :destroy]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
