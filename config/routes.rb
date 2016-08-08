Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :contacts, only: [:new, :create]
  get 'tags/:tag', to: 'posts#index', as: :tag
  get '/about', to: 'pages#about'
  get '/contacts', to: 'contacts#new'
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  
  root "posts#index"

  get '*path' => redirect('/')
end
