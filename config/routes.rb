Rails.application.routes.draw do
	get 'dashboard/index'
	root 'dashboard#index', as: 'dashboard'
	get 'appointments/new', as: 'new'
	resources :appointments
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
