Rails.application.routes.draw do

  resources :articles
  mount Seo::Engine => '/seo'
end
