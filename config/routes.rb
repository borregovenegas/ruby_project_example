Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #aui es donde van las rutas
  resources :events
  
  resources :users#agregamos esl users
  #aqui es donde hacemos las rutas.
  #:id es la variable que guarda id
  #:to es para hacia donde va a ir (la interfaz)
  #:as como es que se va a llamas el metodo de la ruta.
  get 'events/:id/register',  to: 'events#register', as: 'register_to_event'
  post 'events/:id/register' , to: 'events#register_user' , as: 'register_user'
  
  resources :users

end
