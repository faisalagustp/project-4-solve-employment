Rails.application.routes.draw do
  # devise_for :controllers
  devise_for  :users, :controllers => {:registrations => "users/registrations"}

  resources :jobs
  resources :job_applications
  resources :employers
  resources :employees

  root "static#homepage"

  post '/job_applications/:id', to: 'job_applications#hire', as: 'hire'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
