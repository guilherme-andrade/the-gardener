class GardenerPlantsController < ApplicationController
  def create
  	@plant = Plant.find(params[:plant_id])

    params[:gardener_plant][:gardener_id].each do |gardener_id|
      @gardener_plant = GardenerPlant.new(gardener_id: gardener_id)
      @gardener_plant.plant = @plant
      @gardener_plant.save
    end
  	redirect_to @plant
  end

  def gardener_plant_params
  	params.require(:gardener_plant).permit(:gardener_id)
  end
end
