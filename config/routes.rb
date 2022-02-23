Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'home/about' => "homes#index", as: "about"
  patch 'books/:id'=>'books#update', as: 'update_book'
  delete 'books/:id'=>'books#destroy', as: 'destroy'
  resources :books, only: [:new, :create, :index, :show, :edit]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
