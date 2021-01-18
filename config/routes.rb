Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
