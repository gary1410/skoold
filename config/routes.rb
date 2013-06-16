Cfa::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  #as :admin_user do
  #  get '/login' => 'devise/sessions#new', :as => :new_admin_user_session
  #  post '/login' => 'devise/sessions#create', :as => :admin_user_session
  #  delete '/logout' => 'devise/sessions#destroy', :as => :destroy_admin_user_session
  #end

  ActiveAdmin.routes(self)

  namespace :api, defaults: {format: 'json'} do
    resources :students, :only => [:index] do
      resources :cases, :only => [:create, :index]
    end
    resources :cases, :only => [:index, :show] do
      member do
        get :audio
      end
    end

    match '/login(.:format)' => "sessions#create", via: :get, :as => :login
  end

end
