Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    registrations: "admins/registration"
  }
  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    passwords: "customers/passwords",
    registrations: "customers/registrations"
  }
  
  get '/customers/sign_out' => 'devise/sessions#destroy'

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :ordered_items, only: [:update]
  end

  scope module: :customers do
    resource :customers, only: [:show, :edit, :update]
    get "customers/unsubscribe"
    patch "customers/withdraw"
    root to: "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    resources :orders, only: [:index, :show, :new, :create]
    post "orders/confirm"
    get "orders/finish"
    resources :shippings, only: [:index, :create, :edit, :update, :destroy]
    delete "cart_items/all_destroy"
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :ordered_items, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
