Araguaia::Application.routes.draw do
  root to: "home#index"
  resources :home, only: :index
  devise_for :users


  # Sample resource route within a namespace:
     namespace :admin do
     resources :dashboard, only: :index
     root to: "dashboard#index"

     resources :services
     resources :users
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
     end


end

ActionDispatch::Routing::Translator.translate_from_file(
    'config/locales/routes.yml', {
    keep_untranslated_routes: true,
    :no_prefixes => true })
