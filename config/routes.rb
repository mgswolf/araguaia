Araguaia::Application.routes.draw do
  root to: "home#index"
  get "/jobs", to: "jobs#index", as: :jobs
  get "/job/:id", to: "jobs#show", as: :job

  devise_for :users



  # Sample resource route within a namespace:
     namespace :admin do
     resources :dashboard, only: :index
     root to: "dashboard#index"

     resources :equipment
     resources :jobs
     resources :laboratory_items
     resources :reports
     resources :services
     resources :users
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
     end


end

ActionDispatch::Routing::Translator.translate_from_file(
    "app/locales/routes.yml", {
    keep_untranslated_routes: true,
    :no_prefixes => true })
