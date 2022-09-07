class PreferencesController < ApplicationController
  before_action :authenticate_user!
  def index
    @preferences = view_context.hide_preferences(Breed.all)
  end

  def create
    respond_to do |format|
      count = view_context.fetch_preferences(params)
      if count == 0
        format.html { redirect_to dashboard_path }
      else
        format.html { redirect_to dashboard_path, notice: "You added #{count} preferences" }
      end
    end
  end

  def destroy
    respond_to do |format|
      if params[:breed_names].present?
        params[:breed_names].each do |breed|
          user = current_user
          user.user_preferences = user.user_preferences.reject { |pref| pref == breed }
          user.save
        end
        format.html { redirect_to dashboard_path, alert: "Removed #{params[:breed_names].length} preferences" }
      else
        format.html { redirect_to dashboard_path }
      end
    end
  end
end
