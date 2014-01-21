Cfp::Application.routes.draw do
  root 'application#home'
  resources :proposals, only: [:new, :create]
end
