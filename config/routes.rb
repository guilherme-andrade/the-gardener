Rails.application.routes.draw do
  get 'gardener_plants/create'
  get '/', to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gardens, only: [:show] do
  	
  	resources :plants, only: [:create]
  
  end


  resources :plants, only: [:destroy, :show] do
	  resources :gardener_plants, only: [:create]
  end
end
