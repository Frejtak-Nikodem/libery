Rails.application.routes.draw do
  root "menu#index"

  get "authors/search", to: "authors#search"
  get "books/search", to: "books#search"
  
  resources :authors, :menu, :books
end
