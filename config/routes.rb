Rails.application.routes.draw do
  root to:'homes#top'
  resources :books
  post 'books' => 'books#create'
  patch 'books/:id' => 'books#update', as: 'update_book'
  get 'books/:id' => 'books#show', as: 'show_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get 'books/:id' => 'books#deletebook'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end