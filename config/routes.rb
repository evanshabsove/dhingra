Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :galleries do
    resources :paintings
  end

  resources :contacts, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]

  root 'home#index'

  get '/about', to: 'home#about', as: 'about'

  get '/contact', to: 'home#contact', as: 'contact'

  get '/blog', to: 'home#blog', as: 'blog'

  get '/admin', to: 'sessions#admin', as: 'admin_log_in'

  get '/dashboard/information', to: 'dashboard#information', as: 'dashboard_information'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard_index'

  get '/dashboard/edit', to: 'dashboard#edit', as: 'dashboard_edit'

  get '/dashboard/create', to: 'dashboard#create', as: 'dashboard_create'

  get '/dashboard/:id', to: 'dashboard#paintings', as: 'dashboard_painting'
end
