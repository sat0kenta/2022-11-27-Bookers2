Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create]
  end
  resources :users, only: [:index, :show, :edit, :update]
  
  get 'users/show'

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :favorite, only: [:create, :destroy]
  end
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  #get 'users' => 'users#index'

  #post 'books' => 'books#create'
  #get 'books' => 'books#index'
  #get 'books/:id' => 'books#show', as: 'book'
  #get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  #patch 'books/:id' => 'books#update', as: 'update_book'
  #delete 'books/:id' => 'books#destroy', as: 'destroy_book'

end