Rails.application.routes.draw do

  root 'tests#index'

  resources :tests do
    resources :questions
  end

  resources :categories, only: %i[index show]
  resources :users

  get '/tests/:category/:title', to: 'tests#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
