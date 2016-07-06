Rails.application.routes.draw do

  root to: 'home#index'

  resources :articles
  
  mount Seo::Engine, at: '/seo'
end
