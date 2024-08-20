Rails.application.routes.draw do
  devise_for :users

  resources :tasks do
    resources :comments, only: %i(new create destroy)
  end
  root 'pages#home'
end
