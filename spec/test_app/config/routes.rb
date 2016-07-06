Rails.application.routes.draw do

  get 'home/index'

  root to: 'home#index'

  resources :articles
  
  mount Seo::Engine => '/seo'
end
