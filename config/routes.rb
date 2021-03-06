Rails.application.routes.draw do
  resources :notifications
  #resources :comments
  resources :articles do
    resources :comments
  end
  resources :patients
  resources :appointments
  resources :profiles#,  path: '/profiles/new'

  #resources :pages
  resources :news
  devise_for :users

  #namespace :landingpage do
    #get 'index'
    #get 'index/view'
    #root 'landingpage#index'
  #end
  #get 'profiles/new'
  #get 'profiles/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :notifications, only: [:index, :show]
  ##Root page Landing Page
  root 'landingpage#index'
  ##get signed inuser profile
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'

  # #if the user has not created an account yet redirect to create account page
  get '/profiles/:id', to: 'profiles#show', as: 'profile_user'
  get 'statistics', to: 'landingpage#statistics'

  ##Testing
  get 'admin' => 'landingpage#statistics'
  #get 'admin' => 'admin#index'
  #get 'admin' => 'admin#index'


  #get 'statistics/statistics'
  #post 'login', to: 'sessions#create'


end
