Rails.application.routes.draw do
  
  get 'home/index'
  
  get   '/cadastro', to: 'cadastro#new'
  post  '/cadastro', to: 'cadastro#save'
  get   '/cadastro/edit', to: 'cadastro#edit'
  post  '/cadastro/edit', to: 'cadastro#update'
  get   '/cadastro/complete', to: 'cadastro#complete'
  get   '/cadastro/first_dog', to: 'cadastro#first_dog'
  
  get 'album/dog/:dog_id', to: 'album#dog'
  get 'album/dono/:dono_id', to: 'album#dono'
  
  
  get 'latidas/domatch/:match_id', to: 'latidas#domatch'
  get 'latidas/euvi/:match_id', to: 'latidas#euvi'
  post 'latidas/enviar', to: 'latidas#enviar'
  
  resources :fotos, only: [:create, :update, :destroy]

  resources :dogs
  
  resources :matches
  
  get 'matches/naorolamais/:match_id', to: 'matches#naorolamais'

  #rotas do login via facebook
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :login

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
