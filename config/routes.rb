Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_for :users, controllers: { sessions: "users/sessions", confirmations: 'users/confirmations', 
                                    :registrations => 'users/registrations', :passwords => 'users/passwords',
                                    :mailer => 'users/mailer' }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
    get "sign_up", to: "users/registrations#new"
    get "forgot_password", to: "users/passwords#new"
  end

  get 'edit_password', to: "user#edit", as: 'edit_password'
  patch 'update_password', to: "user#update_password", as: 'update_password'  
  get 'edit_profile', to: "user#edit_profile", as: "edit_profile"
  patch 'update_profile', to: "user#update_profile", as: 'update_profile'
  get 'members/:token', to: "user#members_token", as: "members_token"

  get 'static_page/:label', to: 'static_pages#index', as: 'static_page'
  post "contact_us", to: "home#contact_us", as: 'contact_us'
  

  get '/:name', to: 'home#page', as: 'page'

  resources :careers do
    resources :career_applies
  end

  resources :inquiries

  root to: "home#index"
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
