Rails.application.routes.draw do
  resources :products
  resources :line_items
  resources :categories
  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/posts'
    get 'admin/comments/:id', to: 'admin#comments', as: 'admin_comment'
    get 'admin/users'
    get 'admin/show_post/:id', to: 'admin#show_post', as: 'admin_post'
  end
  
  get 'search', to: "search#index"
  get 'users/profile'
  devise_for :users, controllers: {
    
    user_omniauth_authorize:  'users/auth/google',
    omniauth_callbacks: 'users/omniauth_callbacks', 
    sessions: 'users/sessions',
    registrations: 'users/registrations'

  }  
  
  namespace :paypal do
    resources :checkouts, only: [:create] do
      collection do
      get 'line_item/new', to: 'line_items#new'
      end
    end
  end

  get '/u/:id', to: 'users#profile', as: 'user'

  resources :posts do 
    resources :comments

  end
  
  get 'pages/about', to: 'pages#about'
  get 'pages/pricing', to:'pages#pricing'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
end
