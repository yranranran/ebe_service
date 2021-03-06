Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
  resources :evidences, only: %i[index create edit update destroy]
  resources :bookmark_questions, only: %i[create destroy]
  resources :like_answers, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  resources :categories, only: %i[index create edit update destroy]
  resources :tags, only: %i[index create edit update destroy]
  resources :authors, only: %i[index create edit update destroy]
end
