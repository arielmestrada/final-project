class PagesController < ApplicationController
  # root path
  def home; end

  def dashboard; end

  def view_profile
    @profile = User.find(params[:id])
    @user_preferences = view_context.get_user_preferences(@profile)
  end

  def not_found; end
end
