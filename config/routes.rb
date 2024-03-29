Mi::Application.routes.draw do
  devise_for :trainers

  devise_for :admins

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  root :to => 'home#index'
  namespace :admin do
    resources :domains
    resources :trainers do
      scope :module => :trainers do
        resources :timeslots        
      end
    end
    resources :faqs
    resources :alerts
    resources :schedules do
      resource :feedback, :module => :schedules
    end
    root :to => 'domains#index'
  end


  resources :trainers do
    scope :module => :trainers do
      resources :timeslots
      resources :schedules do
        resource :feedback, :module => :schedules        
      end

    end
  end

  resource :prohibited, :only => [:show]
  resources :schedules do
    get :timeslot_to_display, :on => :member
  end
  
  resources :faqs

  resources :users do
    scope :module => :users do
      resources :schedules      
    end

  end

end
