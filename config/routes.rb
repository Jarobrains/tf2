Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/main', :controller => 'updates' , :action => 'index'


# devise_for :users
  # Routes for the Thought resource:
  # CREATE
  get '/thoughts/new',      :controller => 'thoughts', :action => 'new',    :as => 'new_thought'
  post '/thoughts',         :controller => 'thoughts', :action => 'create', :as => 'thoughts'

  # READ
  get '/thoughts',          :controller => 'thoughts', :action => 'index'
  get '/thoughts/:id',      :controller => 'thoughts', :action => 'show',   :as => 'thought'

  # UPDATE
  get '/thoughts/:id/edit', :controller => 'thoughts', :action => 'edit',   :as => 'edit_thought'
  patch '/thoughts/:id',    :controller => 'thoughts', :action => 'update'

  # DELETE
  delete '/thoughts/:id',   :controller => 'thoughts', :action => 'destroy'


# CREATE
  get("/updates/new", {:controller => "updates", :action => "new"})
  get("/create_update", {:controller => "updates", :action => "create"})

  #READ
  get("/updates/:id", {:controller => "updates", :action => "show"})
  #get("/posts/", {:controller => "posts", :action => "index"})

  # UPDATE
  #get("/posts/:id/edit", {:controller => "posts", :action => "edit"})
  #get("/update_post/:id", {:controller => "posts", :action => "update"})

  # DESTROY
  #get("/destroy_post/:id", {:controller => "posts", :action => "destroy"})






  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
  #     resources :thoughts, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :thoughts
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
