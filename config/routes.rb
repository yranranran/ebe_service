Rails.application.routes.draw do
  root 'home#show'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  resources :users, only: %i[new create]
  resources :questions do
    resources :answers, only: %i[create destroy], shallow: true
    collection do
      get :bookmark_questions
    end
  end
  resources :evidences, only: %i[index]
  resources :bookmark_questions, only: %i[create destroy]
end
