Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions", passwords: "passwords", confirmations: 'confirmations' }
  root "menu#index"

  get "authors/search", to: "authors#search"
  post "authors/search", to: "authors#search"
  get "books/search", to: "books#search"
  post "books/search", to: "books#search"
  get "menu/accounts", to: "menu#accounts"
  delete "users/:id", to: "users#destroy"
  get "books/:id/rental", to: "books#rental", as: "rental"
  get "books/:id/unrental", to: "books#unrental", as: "unrental"
  get "menu/users_book", to: "menu#users_book"
  get "menu/user_dashboard", to: "menu#user_dashboard"
  get "menu/admin_dashboard", to: "menu#admin_dashboard"
  
  
  resources :authors, :menu, :books, :users, :comments

  resources :books do
    resources :comments
  end
end