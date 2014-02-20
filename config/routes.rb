Cfp::Application.routes.draw do
  root 'proposals#new'
  resources :proposals, only: [:new, :create, :edit, :update]
end
