Rails.application.routes.draw do
  devise_for :controllers
  devise_for :admins

  # namespace :admin do
  #   DashboardManifest::DASHBOARDS.each do |dashboard_resource|
  #     resources dashboard_resource
  #   end
  #
  #   root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  # end

  resources :deliveries
  resources :prizes
  devise_for :users
  resources :user_bets

  resource :prizes do
    get '/:id/buy' => 'prizes#buy', :on => :collection, :as => 'buy_prize'
    get '/:id/delivery_info' => 'prizes#delivery_info', :on => :collection, :as => 'delivery_info'
  end

  resource :delivery do
    get '/new/:prize_id' => 'deliveries#new', :on => :collection, :as => 'new_prize_delivery'
    get '/create/:prize_id' => 'deliveries#create', :on => :collection, :as => 'new_prize_create'
  end

  resources :main, [:except] => [:create, :new, :edit, :update, :destroy] do
    collection do
      get 'lol_matches', :as => 'lol_matches'
      get 'csgo_matches', :as => 'csgo_matches'
      get 'dota2_matches', :as => 'dota2_matches'
      get 'sc2_matches', :as => 'sc2_matches'
      get 'all_matches', :as => 'all_matches'
      get 'prizes', :as => 'prizes'
    end
  end

  resources :bets do
    collection do
      get 'current_matches', :as => 'current_matches'
      get 'finished_matches', :as => 'finished_matches'
      get 'lol_matches', :as => 'lol_matches'
      get 'csgo_matches', :as => 'csgo_matches'
      get 'dota2_matches', :as => 'dota2_matches'
      get 'sc2_matches', :as => 'sc2_matches'
    end
  end

  resources :users do
    collection do
      get 'bets', :as => 'my_bets'
      get 'profile', :as => 'profile'
    end
  end

  #resources :admin

  resource :user_bets do
    get "/bet/:id" => 'user_bets#new', :on => :collection, :as => "user_bet"
  end

  resource :bets do
    get "/finish/:id" => "bets#finish", :on => :collection, :as => "finish_match"
    get "/finished/:id" => "bets#finished", :on => :collection, :as => "finished_match"
  end

  # resources :admin do ##unused
  #   get "/panel/" => "admin#panel", :on => :collection, :as => "admin_panel"
  # end




  root 'main#index'
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
