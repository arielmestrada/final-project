class PreferencesController < ApplicationController
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
end
