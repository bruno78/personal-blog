Rails.application.routes.draw do
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: :tag
  root "posts#index"
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
end
