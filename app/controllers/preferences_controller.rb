class PreferencesController < ApplicationController
  def index
    @preferences = Breed.all
  end

  def create
    binding.pry
    redirect_to preferences_path
  end
end
