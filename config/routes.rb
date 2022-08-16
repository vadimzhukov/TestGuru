Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests do 
    resources :questions, only: %i[index show new create]
    get '/questions/:id/delete', to: 'questions#destroy'
  end


end
