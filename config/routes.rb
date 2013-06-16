Cfa::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: {format: 'json'} do
    resources :students, :only => [:index] do
      resources :cases, :only => [:create, :index] do
      end
    end
    resources :cases, :only => [:index, :show] do
      member do
        get :audio
      end
    end
    get '/students/:student_id/post(.:format)', :to => "cases#create", :as => :create_cases

    match '/login(.:format)' => "sessions#create", via: :get, :as => :login
  end

end
