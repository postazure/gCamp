Rails.application.routes.draw do
  resources :users
  resources :projects do
    resources :tasks
    resources :memberships
  end

  root 'welcome#home'

  get "about" => "about#us", as: :about
  get "terms" => "about#terms", as: :terms
  get "faq" => "about#faq", as: :faq

  get "export" => "tasks#export"

  get   "/signup" => "registrations#new"
  post  "/signup" => "registrations#create"
  get   "/signin" => "authentication#new"
  post  "/signin" => "authentication#create"
  get   "/signout" => "authentication#destroy"



end
