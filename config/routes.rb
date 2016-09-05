Rails.application.routes.draw do
  root "main#index2"
  get "main/index"
  get "main/index2"
  get "jquery/index"
 
  
  # 게시글 관련 주소
  get "board/index"
  get "board/aa"
  post "board/create"
  get "board/update"
  get "board/delete"
  get "board/write"
  get "board/posts/:id" => 'board#posts'
  get "board/mboard"
  post "board/sboard"
  get "board/sboard"
  post "board/apply"
  get "board/posts"
  get "board/myposts"
  get "board/modify/:board_id" => "board#modify"
  get "board/modify2/:board_id" => "board#modify2"
  get "board/destory/:id" => "board#destory"
  get "board/destory2/:id" => "board#destory2"
  get "board/message_check"
  get "board/check/:id" => "board#check"
  post "board/modify_profile"
  get "board/ask"
  get "board/destory3/:id" => "board#destory3"
  
  # 유저정보 관련 주소
  get "users/signup"
  get "users/create"
  post 'users/create'
  post  'users/log_up_process'
  get  'users/log_out'
  post 'users/find'
  get  "user/modify_profile"


 # 베타
 get "board/ex"
  
  
  
  
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
