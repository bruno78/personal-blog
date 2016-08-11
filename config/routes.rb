Rails.application.routes.draw do
  devise_for :users   #, :skip => [:registrations]
=begin
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    patch 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
=end
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
