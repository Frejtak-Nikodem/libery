Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions", passwords: "passwords", confirmations: 'confirmations' }
  root "menu#index"

  get "authors/search", to: "authors#search"
  post "authors/search", to: "authors#search"
  get "books/search", to: "books#search"
  post "books/search", to: "books#search"
  get "menu/accounts", to: "menu#accounts"
  delete "users/:id", to: "users#destroy"
  
  resources :authors, :menu, :books, :users
end