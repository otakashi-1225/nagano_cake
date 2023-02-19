Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...

  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  resources :customers, only: [:show, :update],  module: 'public'
  get '/customer/edit', to: 'public/customers#edit', as: 'edit_customer'
  get '/customer/quit', to: 'public/customers#quit', as: 'quit_customer'
  patch '/customer/flag', to: 'public/customers#flag', as: 'flag_customer'

  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items
  end


  root to: 'homes#top'
  get "about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
