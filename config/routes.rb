Rails.application.routes.draw do
  root 'supports#top'
  resources :users
end
