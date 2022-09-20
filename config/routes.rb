Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { confirmations: 'users/confirmations' }

  resources :answers

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index do
        end
      end
    end
  end
end
