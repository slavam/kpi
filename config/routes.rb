Kpi::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  resources :blocks
  resources :factors do
    collection do
      get :show_values, :show_factors_by_template
    end
  end
  resources :kpi_templates
  resources :weight_factors
  resources :performances do
    collection do
      get :get_report_params, :report_print
      post :show_report
    end
  end

  resources :workers do
    collection do
      get :my_show
    end
  end
  resources :subdivisions do
    collection do
      get :my_show
    end
  end
  resources :businesses
  resources :branch_of_banks

#  resources :maindivisions do
#    resources :subdivisions do
#      collection do
#        get :my_show
#      end
#    end
#    collection do
#      get :my_show
#    end
#  end
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
  root :to => "blocks#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
