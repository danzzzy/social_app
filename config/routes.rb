Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :children, only: [:index, :show, :create, :edit]
  resources :rooms, only: [:index, :show] do
    resources :posts, only: [:show, :create, :edit, :destroy] do
      resources :comments, only: [:create, :edit, :destroy]
    end
  end
end
