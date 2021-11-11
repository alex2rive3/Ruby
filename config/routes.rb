Rails.application.routes.draw do
  resources :commentis, only: [:create]
  resources :proyectos
  resources :categories
  resources :comment_photos
  resources :comment_books
  get 'users/edit'
  resources :users, only: [:update]
  get "perfil", to:"users#edit"
  get 'books/index'
  get 'books/new'
  get 'books/show'
  get 'books/edit'
  resources :books
  resources :photos
  get 'my_photos', to: 'photos#my_photos', as: 'my_photos'
  devise_for :users
  get 'home/index'
  resources :articles
  get 'bienvenida', to:"home#index"
  root to: "home#index"
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
