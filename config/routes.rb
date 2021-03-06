Rails.application.routes.draw do

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  resources :teams, only: [:index, :show]
  resources :matches, only: [:index, :show]
  resources :bo_tournaments, only: [:index, :show]
  resources :tournaments, only: [:index, :show]
  resources :bos, only: [:index, :show]
  resources :games, only: [:index, :show]
  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'tournaments#index'

  # Remove the screenshot
  get 'match/:id/remove_screen_shot', to: 'matches#remove_screen_shot', as: 'remove_match_screen_shot'

  # Add user to the team
  get 'teams/:id/add_user', to: 'teams#add_user', as: 'add_user_to_team'

  # Remove user from the team
  get 'teams/:id/delete_user', to: 'teams#delete_user', as: 'delete_user_from_team'

  # Remove user from the team
  get 'tournaments/:id_tournament/:id_team/enroll', to: 'tournaments#enroll', as: 'enroll_team_to_tournament'

  # Remove user from the team
  get 'tournaments/:id_tournament/:id_team/leave', to: 'tournaments#leave', as: 'leave_tournament'

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
