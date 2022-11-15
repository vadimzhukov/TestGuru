Rails.application.routes.draw do
  namespace :admin do
    get 'gists/index'
  end

  root to: redirect('/users/login')
  # root to: 'tests#index'

  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index do
        end
      end
    end
    resources :gists, only: %i[index create]
  end

  authenticate :user, ->(user) { user.admin? } do
    mount PgHero::Engine, at: 'pghero'
  end
end
