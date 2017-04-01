class StaticController < ApplicationController
  before_action :logged_in?

  def homepage
  end

  def logged_in?
    if current_user.employer || current_user.employee
      redirect_to :jobs
    end
  end
end
