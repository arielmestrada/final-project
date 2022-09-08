class ErrorsController < ApplicationController
  def banned
    redirect_to dashboard_path unless current_user.banned?
  end

  def not_found
    redirect_to banned_path if current_user.banned?
  end
end
