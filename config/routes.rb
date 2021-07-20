Rails.application.routes.draw do
  resources :comments
  resources :articles do
    resources :comments
  end
  resources :patients
  resources :appointments
  resources :profiles#,  path: '/profiles/new'

  #resources :pages
  resources :news
  devise_for :users
  #get 'landingpage/index'
  #namespace :landingpage do
    #get 'index'
    #get 'index/view'
    #root 'landingpage#index'
  #end
  #get 'profiles/new'
  #get 'profiles/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'landingpage/index'
  root 'landingpage#index'
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  get '/profiles/:id', to: 'profiles#show', as: 'profile_user'
  #post 'login', to: 'sessions#create'


end
