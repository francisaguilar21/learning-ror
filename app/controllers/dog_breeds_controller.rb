class DogBreedsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]

  def initialize
    super
    @dog_breed_service = DogBreedService.new
  end

  def index
    breeds = @dog_breed_service.fetch_breeds
    render json: breeds
  end

  def show
    breed_details = @dog_breed_service.fecth_breed(params[:id])
    render json: breed_details
  end
end
