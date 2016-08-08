Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :contacts, only: [:new, :create]
  get 'tags/:tag', to: 'posts#index', as: :tag
  root "posts#index"
  get '/about', to: 'pages#about'
  get '/contacts', to: 'contacts#new'
end
