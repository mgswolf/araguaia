Araguaia::Application.routes.draw do
  root to: "home#index"
  get "/jobs", to: "jobs#index", as: :jobs
  get "/job/:id", to: "jobs#show", as: :job

  get "/services", to: "services#index", as: :services
  #get "/service/:id", to: "services#show", as: :service

  get "/reports", to: "reports#index", as: :reports
  get "/report/:id", to: "reports#show", as: :report

  get "/equipments", to: "equipment#index", as: :equipments
  #get "/equipment/:id", to: "equipment#show", as: :equipment

  get "/laboratory", to: "laboratory#index", as: :laboratory
  #get "/laboratory/:id", to: "laboratory#show", as: :laboratory

  get "/contact", to: "contact#new", as: :contact
  post "/contact", to: "contact#create", as: false

  get "/company", to: "company#index", as: :company


  devise_for :users


     namespace :admin do
       root to: "dashboard#index"

       resources :banners
       resources :companies
       resources :contacts, only: [:index, :show, :destroy]
       resources :equipment
       resources :jobs
       resources :laboratory_items
       resources :reports
       resources :services
       resources :users
     end


end

ActionDispatch::Routing::Translator.translate_from_file(
    "app/locales/routes.yml", {
    keep_untranslated_routes: true,
    :no_prefixes => true })
