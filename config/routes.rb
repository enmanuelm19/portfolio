Rails.application.routes.draw do
  scope "(:locale)", locale: /es|en/ do
    get 'home/index'
    post 'contact-me', to: 'messages#create', as: 'create_message'
    devise_for :users, skip: :registration

    devise_scope :user do
      authenticated :user do
        root 'admin/dashboard#index', as: :root
      end

      unauthenticated do
        root 'home#index', as: :unauthenticated_root
      end
    end

    get '/mode', to: 'application#set_dark_mode'

    namespace :admin do
      resources :posts
      resources :projects
      get 'dashboard', to: 'dashboard#index'
    end

    resources :posts, only: %i[index show]
    resources :projects, only: %i[index show]
  end
end
