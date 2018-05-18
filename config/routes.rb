Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'admin/posts#index', as: :root
    end

    unauthenticated do
      root 'posts#new', as: :unauthenticated_root
    end
  end

  namespace :admin do
    resources :posts, only: [:index]
  end

  resources :posts, only: [:index, :show]
end
