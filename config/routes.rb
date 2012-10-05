DataEngineering::Application.routes.draw do
  get "data_import/purchases", :as => :import_purchases
  post "data_import/purchases", :as => :import_purchases
  root :to => 'data_import#purchases'
end
