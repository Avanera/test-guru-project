Rails.application.routes.draw do

  devise_for :users, path: 'gurus', path_name: { sign_in: :login, sign_out: :logout}

  root 'tests#index'

  delete :logout, to: 'sessions#destroy'

  resources :tests do
    member do
      post :start
    end
  end

  # GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    root 'tests#index'
    resources :tests do
      resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end
    end
  end

  get '/tests/:category/:title', to: 'tests#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
