Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :clients do
    resources :residence_reports
  end
  resources :residence_reports, only: :index
end
