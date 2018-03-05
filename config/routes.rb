Rails.application.routes.draw do



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
		     sessions: 'users/sessions',
		    registrations: 'users/registrations'
	  }

    resources :lists do
        get 'lists/:estatus', to: 'lists#listo',  as: 'listo'
        get 'detalle', to: 'lists#detalle',  as: 'detalle'
        collection do
          get 'admin_list', to: 'lists#admin_list',  as: 'admin_list'
        end
    end



  resources :users
  root 'lists#index'
end
