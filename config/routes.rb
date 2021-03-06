Cfp::Application.routes.draw do
  root 'proposals#new'
  resources :proposals, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  namespace :crew do
    resources :proposals do
      resources :comments, only: [:create]
      resources :feedbacks, only: [:create]
      member do
        patch :mark_as_favorite
        patch :unfavorite
        patch :mark_as_read
      end
    end
    resource :user
    root to: 'proposals#index'
  end
  get "log_out" => "sessions#destroy", :as => "log_out"
end
