Seo::Engine.routes.draw do
  resources :pages, only: [:index, :edit, :update], path: '/'
end
