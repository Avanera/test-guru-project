Rails.application.routes.draw do
  devise_for :users, path: 'gurus',
                     path_name: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions' }

  root 'tests#index'

  delete :logout, to: 'sessions#destroy'

  resources :tests, only: :index do
    post :start, on: :member
  end

  # GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    root 'tests#index'
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true
      end
    end
  end

  get '/tests/:category/:title', to: 'tests#search'

  get '/contact', to: 'contacts#new'
  post '/contact', to: 'contacts#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
