Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'homes#top'
  devise_for :users
  resources :users,         only:[:index, :show, :create, :update, :destroy]
  resources :homes,         only:[:top, :about]
  resources :scores,        only:[:index, :show, :create, :update, :destroy]
  resources :answers,       only:[:create, :update]
  resources :relationships, only:[:create, :destroy]


  resources :quizzes,     only:[:index, :show] do
    member do
      post :check_answer
    end
    collection do
      get :finished
    end
  end
  # root to: 'questions#show', id: 1

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
