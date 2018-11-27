class HomesController < ApplicationController

  def index
    @abv=params[:abv].to_f
    @volume=params[:volume].to_f
    @unit=params[:unit]
    @cost=params[:cost].to_f
    @packaging=params[:packaging]

    @calculated_volume = Constants.calculate_volume(@packaging, @volume, @unit)
    @number_of_servings = Constants.calculate_servings(@abv, @calculated_volume)
    @cost_per_serving = Constants.calculate_cost_per_serving(@cost, @number_of_servings)

    @wine_cost = Constants.calculate_wine_cost(@cost_per_serving)
    @spirits_cost = Constants.calculate_spirits_cost(@cost_per_serving)
    @beer_6pk_cost = Constants.calculate_6pk_12oz_of_beer_cost(@cost_per_serving)
    @beer_4pk_cost = Constants.calculate_4pk_16oz_of_beer_cost(@cost_per_serving)

  end

  def new
  end

end
