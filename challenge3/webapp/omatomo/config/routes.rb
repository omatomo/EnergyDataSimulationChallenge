Rails.application.routes.draw do
  root "houses#index"
  resources :houses do
  	collection do
  		get  'import_csv_new'
  		post 'import_csv'
  	end
  end
end
