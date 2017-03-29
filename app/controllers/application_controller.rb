class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # devise_group :user, contains: [:employee, :employer]
  private

  def after_sign_in_path_for(resource)
    '/jobs'
  end
end
