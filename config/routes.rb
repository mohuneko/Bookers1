Rails.application.routes.draw do
  # For details oren the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root 'home#top'

end
