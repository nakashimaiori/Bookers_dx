Rails.application.routes.draw do
  

  
  
  get 'users/show'
  get 'users/edit'
  get 'users/index'
  devise_for :users
  root :to => 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, except:[:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
