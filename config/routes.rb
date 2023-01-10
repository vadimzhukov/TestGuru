Rails.application.routes.draw do
  get 'users/show'
  
  namespace :admin do
    get 'gists/index'
  end

  root to: redirect('/users/login')

  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout }

  resources :badges, only: %i[index]


  resources :users, only: %i[show] do
    member do
      get :rewards
      get :badges
    end
  end

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :feedbacks, only: %i[new create]

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
    resources :badges
  end

  authenticate :user, ->(user) { user.admin? } do
    mount PgHero::Engine, at: 'pghero'
  end
end
