AppManager::Application.routes.draw do
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
  root to: "home#index"
  get 'sign_in' => 'sessions#create'
  get 'sign_out' => 'sessions#destroy'

  namespace :super_admin do
    get 'home' => 'super_admin#index'
    resources :users
    resources :companies do
        resources :apps
        get 'roles' => "company_users#index"
        put 'save' => "company_users#update"
    end

    resources :apps, :only => [] do
      resources :versions do
        get 'invite_by_email' => "versions#invite_by_email"
      end
    end


  end

  get 'dashboard' => 'globalmembers#index'

  namespace :admin do

    resources :companies do
      resources :users
      resources :apps
      get 'roles' => "company_users#index"
      put 'save' => "company_users#update"
    end
    resources :users
    resources :apps, :only => [] do
      resources :versions do
        get 'invite_by_email' => "versions#invite_by_email"
      end
    end
  end

  namespace :developer do
    resources :apps, :only => [] do
      resources :versions do
        get 'invite_by_email' => "versions#invite_by_email"
      end
    end
    resources :companies, :only => [:show, :index] do
      resources :apps
      resources :users
    end
  end

  namespace :member do
    resources :companies, :only => [:show]
    resources :apps, :only => [:show, :index]
  end

  get '/email-:vid' => 'home#download_email'
  get '/:vid' => 'home#download'
  

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
