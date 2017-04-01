class StaticController < ApplicationController
  before_action :logged_in?

  def homepage
  end

  def logged_in?
    if current_user
      redirect_to :jobs
    end
  end
end
