Rails.application.routes.draw do

  get 'price_tags/create'

  get 'price_tags/update'

  get 'price_tags/delete'

  get '/admin', to: 'sessions#new'
  post '/admin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :categories do
    resources :services
  end

  resources :services do
    resources :price_tags
  end

  get 'categories/:id/info', to: 'categories#info', as: :cat_info
  get 'categories/:category_id/services/:id/info', to: 'services#info', as: :service_info

  root 'static_pages#index'

  post 'feedback/send_message', as: :send_message

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
