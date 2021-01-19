Rails.application.routes.draw do
<<<<<<< HEAD
  resources :items
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/edit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :customers do
    get 'ordered_items/index'
    get 'ordered_items/show'
    get 'ordered_items/new'
    get 'ordered_items/finish'
  end
  namespace :customers do
    get 'cart_items/index'
  end
  namespace :customers do
    get 'shippings/index'
    get 'shippings/edit'
  end
  namespace :customers do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :customers do
    get 'items/index'
    get 'items/show'
  end
  namespace :customers do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :customers do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end
  
=======
  
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
    resources :orders, only: [:index, :show]
    resources :shippings, only: [:index, :create, :edit, :update, :destroy]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "cart_items" => "cart_items#all_destroy"
    resources :ordered_items, only: [:index, :new, :show, :create]
    post "ordered_items/confirm"
    get "ordered_items/finish"
  end
>>>>>>> 43941bc42dfa95af1e6d2d3814dd464b454273b4
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
