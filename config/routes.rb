Rails.application.routes.draw do
  resources :tasks
  resources :users
  resources :projects

  root 'welcome#home'

  get "about" => "about#us", as: :about
  get "terms" => "about#terms", as: :terms
  get "faq" => "about#faq", as: :faq

  get "export" => "tasks#export"
end
