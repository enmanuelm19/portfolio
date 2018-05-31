Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'admin/dashboard#index', as: :root
    end

    unauthenticated do
      root 'home#index', as: :unauthenticated_root
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
