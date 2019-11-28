class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :destroy]

  def create
  	@plant = Plant.new(plant_params)
  	@garden = Garden.find(params[:garden_id])
  	@plant.garden = @garden

  	if @plant.save
  		redirect_to @garden, notice: 'Youve created a plant'
  	else 
      flash[:alert] = 'Couldnt create'
  		render template: 'gardens/show'
  	end
  end

  def destroy
  	@plant.destroy
  	redirect_to @plant.garden
  end

  def show
    @gardener_plant = GardenerPlant.new
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
  	params.require(:plant).permit(:name, :image_url)
  end
end
