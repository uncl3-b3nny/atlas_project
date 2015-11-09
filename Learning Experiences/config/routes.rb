Rails.application.routes.draw do
  resources :tags
  resources :designs
  resources :atlas_registrations
  resources :a5s
  resources :a4s
  resources :a3s
  resources :a2s
  resources :labors
  resources :quantities #to do: put quantities in right resources!
  # resources :factory_manufacturing_processes
  # resources :catalogues
  # resources :floorplans
  # resources :blueprints
  # resources :construction_schedules
  # resources :factories
  # resources :manufacturing_processes
  # resources :developments
  # resources :lots
  # resources :assemblies
  # resources :parts
  # resources :raw_materials
  # resources :registrations
  devise_for :participants # I hit an issue with devise creating new participants while logged in as another participant. the new_participant_registration_path just re-routes you to the root and displays a flash message stating you are already logged in. I didn't feel like dealing with it until I get the catalogue up and running
  # resources :organizations
  # resources :credits
  # resources :debts
  # resources :tools
  # resources :milestones
  # resources :inventories
  # resources :designs

  resources :registrations#has_many through relationships don't go in the nest?
  # These might be ALL wrong

  resources :countries do 
    resources :regions do 
      resources :catalogues
      # resources :raw_materials #check to see if this line produces duplicates
      resources :master_plans do
        resources :developments do
          resources :deeds do 

            resources :lots do
              # resources :blueprints
              
              resources :buildings do
                # resources :blueprints

                # resources :floorplans do
                #   resources :designs 
                # end# floorplans

                # resources :parts do
                #   resources :raw_materials
                #   resources :blueprints
                #   resources :manufacturing_processes do
                #     resources :factories do
                #       resources :regions
                #     end# factories
                #   end# manufacturing_processes
                # end# parts

                resources :assemblies do
                  resources :quantities
                #   resources :blueprints

                #   resources :parts do
                #     resources :raw_materials
                #     resources :blueprints
                #     resources :manufacturing_processes do
                #       resources :factories do
                #         resources :regions
                #       end# factories
                #     end# manufacturing_processes
                #   end# parts

                #   resources :manufacturing_processes do
                #     resources :factories do
                #       resources :regions
                #     end# factories
                #   end# manufacturing_processes
                end# assemblies

              end# buildings
            end# lots
          end# deeds
        end# developments
      end# master_plans
    end# regions
  end# countries


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'countries#index'

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
  #     #   end
end
