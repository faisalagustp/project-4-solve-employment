Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  # devise_for :controllers
  devise_for  :users, :controllers => {:registrations => "users/registrations"}

  resources :jobs
  resources :job_applications, except: :edit
  resources :employers
  resources :employees
  resources :reviews

  root "static#homepage"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
