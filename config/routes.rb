Rails.application.routes.draw do
  resources :portifolios, except: [:show]
  get 'portifolio/:id', to: 'portifolios#show', as: 'portifolio_show'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
    
  resources :blogs
  
  root to: 'pages#home'
end
