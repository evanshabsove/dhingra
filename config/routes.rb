Rails.application.routes.draw do

  devise_for :users

  resources :products
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  patch :submit_order, to: 'order_items#submit_order', as: 'submit_order'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :galleries do
    resources :paintings
  end

  resources :contacts, only: [:new, :create]
  resources :entries


  scope :dashboard do
    get :province_edit, to: 'provinces#province_edit', as: 'province_edit'
    resources :provinces do
      resources :product_groups
    end
    resources :events
  end

  root to: "home#index"

  resources :users, only: [:new, :create]

  get '/catalogue', to: 'home#catalogue', as: 'catalogue'

  get '/about', to: 'home#about', as: 'about'

  get '/contact', to: 'home#contact', as: 'contact'

  get '/blog', to: 'home#blog', as: 'blog'

  get '/events', to: 'home#events', as: 'events_homepage'

  get '/dashboard/information', to: 'dashboard#information', as: 'dashboard_information'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard_index'

  get '/dashboard/edit', to: 'dashboard#edit', as: 'dashboard_edit'

  get '/dashboard/create', to: 'dashboard#create', as: 'dashboard_create'

  get '/dashboard/:id', to: 'dashboard#paintings', as: 'dashboard_painting'
end
