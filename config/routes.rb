Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...

  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  resources :customers, only: [:show, :edit, :update],  module: 'public'
  get '/customer/quit', to: 'public/customers#quit'
  patch '/customer/flag', to: 'public/customers#flag'



  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }


  root to: 'homes#top'
  get "about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
