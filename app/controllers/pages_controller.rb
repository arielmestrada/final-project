class PagesController < ApplicationController
  # root path
  def home; end

  def dashboard; end

  def view_profile
    @friend = view_context.friend(params[:id].to_i)
    @profile = User.find(params[:id]) if params[:id].present?
    request = view_context.find_friend(@profile)
    @request = view_context.find_friend(@profile) unless request.nil?
    @user_preferences = view_context.get_user_preferences(@profile)
  end

  def not_found; end
end
