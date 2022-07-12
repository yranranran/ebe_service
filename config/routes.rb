Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'home#show'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  resources :users, only: %i[new create]
  resources :questions do
    resources :answers, only: %i[create update destroy], shallow: true do
      collection do
        get :like_answers
      end
    end
    collection do
      get :bookmark_questions
    end
  end
  resources :evidences, only: %i[index]
  resources :bookmark_questions, only: %i[create destroy]
  resources :like_answers, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
end
