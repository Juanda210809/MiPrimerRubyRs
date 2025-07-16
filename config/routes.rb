Rails.application.routes.draw do
    
  resources :products , path:'/' 


get '/products/enviar_correo', to: 'products#formulario_correo', as: :formulario_correo
post '/products/enviar_correo', to: 'products#ejecutar_envio_correo'


  #delete 'products/:id', to: 'products#destroy'
  #patch 'products/:id', to: 'products#update'
  #post '/products', to: 'products#create' 
  #get'/products/new', to: 'products#new', as: :new_product
  #get'/products', to: 'products#index'
  #get'/products/:id', to: 'products#show', as: :product
  #get'/products/:id/edit', to: 'products#edit' , as: :edit_product

end
