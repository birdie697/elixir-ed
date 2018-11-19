module Constants
  SERVINGS_CONVERSION = 60
  ML_TO_OZ_CONVERSATION = 0.033814

  SERVINGS_PER_BOTTLE_OF_WINE = 5
  SERVINGS_PER_BOTTLE_OF_SPIRITS = 16.9
  SERVINGS_PER_6PK_OF_BEER = 6           #6pk of 12oz bottles
  SERVINGS_PER_4PK_OF_BEER = 5.333       #4pk of 16oz cans

  def calculate_servings(in_abv, in_volume, in_unit)

    if in_unit == "ML"
      volume = in_volume*ML_TO_OZ_CONVERSATION
    else
      volume = in_volume
    end

    number_of_servings = ((volume*in_abv)/SERVINGS_CONVERSION).round(2)

    return number_of_servings
  end
  module_function :calculate_servings

  def calculate_cost_per_serving(in_cost, in_number_of_servings)
    cost_per_serving = (in_cost/in_number_of_servings).round(2)
    return cost_per_serving
  end
  module_function :calculate_cost_per_serving

  def calculate_wine_cost(in_cost_per_serving)
    wine_cost = (in_cost_per_serving*SERVINGS_PER_BOTTLE_OF_WINE).round(2)
    return wine_cost
  end
  module_function :calculate_wine_cost

  def calculate_spirits_cost(in_cost_per_serving)
    spirits_cost = (in_cost_per_serving*SERVINGS_PER_BOTTLE_OF_SPIRITS).round(2)
    return spirits_cost
  end
  module_function :calculate_spirits_cost

  def calculate_6pk_of_beer_cost(in_cost_per_serving)
    beer_6pk_cost = (in_cost_per_serving*SERVINGS_PER_6PK_OF_BEER).round(2)
    return beer_6pk_cost
  end
  module_function :calculate_6pk_of_beer_cost

  def calculate_4pk_of_beer_cost(in_cost_per_serving)
    beer_4pk_cost = (in_cost_per_serving*SERVINGS_PER_4PK_OF_BEER).round(2)
    return beer_4pk_cost
  end
  module_function :calculate_4pk_of_beer_cost

end
