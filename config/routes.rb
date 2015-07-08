Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  post 'users/signup', to: 'users#create'
  post 'users/login', to: 'users#login'
  get 'user/:id', to: 'users#show'
  get 'users', to: 'users#index'
  delete 'user/:username/delete', to: 'users#delete'
  patch 'users/:id', to: 'users#update'

  post 'establishments/new', to: 'establishments#create'
  get 'establishments', to: 'establishments#index'
  get 'establishment/:id', to: 'establishments#show'
  patch 'establishment/:id', to: 'establishments#update'

  post 'reviews/new', to: 'reviews#create'
  get 'reviews', to: 'reviews#index'
  get 'review/:id', to: 'reviews#show'
  patch 'review/:id', to: 'reviews#update'
  delete 'review/:id', to: 'reviews#delete'





  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
