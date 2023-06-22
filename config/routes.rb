Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'homes#top'

  #deviseのカスタムコントローラを使用
  devise_for :users, controllers: {
    session:       'users/sessions',
    registrations: 'users/registrations'
  }





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

end
