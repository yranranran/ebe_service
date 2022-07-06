Rails.application.routes.draw do
  root 'home#show'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  resources :users, only: %i[new create]
  resources :questions do
    resources :answers, only: %i[create], shallow: true
  end
end
