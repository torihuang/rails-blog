Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root "blogs#index"

  get "/blogs/:id/posts/new" => "posts#new"
  get "/blogs/:id/posts/:post_id/edit" => "posts#edit"
  get "/blogs/:id/posts/:post_id" => "posts#show"
  patch "/blogs/:id/posts/:post_id" => "posts#update"
  delete "/blogs/:id/posts/:post_id" => "posts#destroy"
  post "/blogs/:id/posts/new" => "blogs#show"

  get "/" => "blogs#index"
  get "/blogs" => "blogs#index"
  get "/blogs/new" => "blogs#new"
  get "/blogs/:id/edit" => "blogs#edit"
  get "/blogs/:id" => "blogs#show"
  put "/blogs/:id" => "blogs#update"
  delete "/blogs/:id" => "blogs#destroy"
  post "/blogs/new" => "blogs#show"

  post "/blogs/:id/posts/:post_id/comments" => "comments#create"

  get "/session/new" => "session#new"
  post "/session/new" => "session#create"
  delete "/session" => "session#destroy"

  get "/users/new" => "users#new"
  get "/users/:id" => "users#show"
  post "/users/new" => "users#show"

  resources :blogs, only: [:index, :show, :new, :edit, :destroy, :update]
  resources :session, only: [:new, :delete]
  resources :users, only: [:new, :edit, :create, :show]
  resources :blogs do
    resources :posts, only: [:show, :new, :edit, :create, :delete, :update]
  end
  resources :blogs do
    resources :posts do
      resources :comments, only: [:show, :new, :edit, :create, :delete, :update]
    end
  end

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
