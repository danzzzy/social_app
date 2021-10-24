Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :children :only [:index, :show, :new, :edit]
  resources :rooms :only[:index, :show]
end
