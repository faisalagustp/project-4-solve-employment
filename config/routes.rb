Rails.application.routes.draw do
  resources :job_applications
  resources :jobs
  devise_for :users
  resources :employers
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
