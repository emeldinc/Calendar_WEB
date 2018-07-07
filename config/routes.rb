Rails.application.routes.draw do
	get 'dashboard/index'
	root 'dashboard#index', as: 'dashboard'
	get 'appointments/new', as: 'new'
	get 'appointments/delete_all', as: 'delete_all'
	resources :appointments
	get "/appointments/recursive/:id", to: "appointments#recursive", as: "recursive"
	post 'appointments/create_recursive', as: 'create_recursive'
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
