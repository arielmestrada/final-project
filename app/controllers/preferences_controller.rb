class PreferencesController < ApplicationController
  def index
    @preferences = view_context.hide_preferences(Breed.all)
  end

  def create
    respond_to do |format|
      count = view_context.fetch_preferences(params)
      if count < 1
        redirect_to preferences_path
      else
        format.html { redirect_to preferences_path, notice: "You added #{count} preferences" }
      end
    end
  end
end
