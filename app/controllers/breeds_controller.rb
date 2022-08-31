class BreedsController < ApplicationController
    
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

    private

    def breed_params
        params.require(:breeds).permit(:body, :user_id)
    end
end
