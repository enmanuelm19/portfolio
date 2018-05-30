Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'admin/posts#index', as: :root
    end

    unauthenticated do
      root 'posts#index', as: :unauthenticated_root
    end
  end

  namespace :admin do
    resources :posts
    resources :projects
    get 'dashboard', to: 'dashboard#index'
  end

  resources :posts, only: %i[index show]
  resources :projects, only: %i[index show]
end
