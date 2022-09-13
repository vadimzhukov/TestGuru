Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :answers
  resources :users, only: :create
  resources :sessions, only: %i[create destroy]

  resources :tests do
    member do
      post :start
    end

    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index do
      end
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
