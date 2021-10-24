Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :children, only: [:index, :show, :create, :edit]
  resources :rooms, only: [:index, :show] do
    resources :posts, only: [:create, :edit, :destroy]
    resources :comments, only: [:create, :edit, :destroy]
  end
end
