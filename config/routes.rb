Rails.application.routes.draw do
  
  post 'main/test'
  post 'score/edit'
  get 'main/result'
  get 'main/result'
  get 'score/list'
  get 'score/edit'
  get 'score/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'main#select'
end
