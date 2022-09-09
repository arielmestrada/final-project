class BreedsController < ApplicationController
    before_action :authenticate_user!
    before_action :read

  def index
    @breeds = Breed.all
  end

  def show
    @breed = Breed.find(params[:id])
  end

  def new
    @breed = Breed.new
  end

  def create
    @breed = Breed.create(breed_params)
  end

  def add_preferred_breed
    @breeds = Breed.all
    respond_to do |format|
      current_user.update(user_preferences: current_user.user_preferences << params[:breed_name])
      format.html { redirect_to breeds_path, success: "You now prefer #{params[:breed_name]}!" }
    end
  end

  private

  def breed_params
    params.require(:breeds).permit(:body, :user_id)
  end

  def read
    authorize! :read, current_user, message: 'Banned' if current_user.banned?
  end
end
