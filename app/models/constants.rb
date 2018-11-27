module Constants

  BOTTLE_750ML = 750
  BOTTLE_12OZ = 12
  CAN_16OZ = 16

  UNITS_IN_6PK = 6
  UNITS_IN_4PK = 4

  WINE_SERVING_OZ = 5
  SPIRITS_SERVING_OZ = 1.5
  BEER_SERVING_OZ = 12

  SERVINGS_CONVERSION = 60
  ML_TO_OZ_CONVERSION = 0.033814

  SERVINGS_PER_BOTTLE_OF_WINE = (BOTTLE_750ML*ML_TO_OZ_CONVERSION)/WINE_SERVING_OZ
  SERVINGS_PER_BOTTLE_OF_SPIRITS = (BOTTLE_750ML*ML_TO_OZ_CONVERSION)/SPIRITS_SERVING_OZ
  SERVINGS_PER_6PK_12OZ_OF_BEER = (BOTTLE_12OZ*UNITS_IN_6PK)/BOTTLE_12OZ
  SERVINGS_PER_4PK_16OZ_OF_BEER = (CAN_16OZ*UNITS_IN_4PK)/BOTTLE_12OZ

  def calculate_servings(in_abv, in_volume, in_unit)

    if in_unit == "ml"
      volume = in_volume*ML_TO_OZ_CONVERSION
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

  def calculate_6pk_12oz_of_beer_cost(in_cost_per_serving)
    beer_6pk_cost = (in_cost_per_serving*SERVINGS_PER_6PK_12OZ_OF_BEER).round(2)
    return beer_6pk_cost
  end
  module_function :calculate_6pk_12oz_of_beer_cost

  def calculate_4pk_16oz_of_beer_cost(in_cost_per_serving)
    beer_4pk_cost = (in_cost_per_serving*SERVINGS_PER_4PK_16OZ_OF_BEER).round(2)
    return beer_4pk_cost
  end
  module_function :calculate_4pk_16oz_of_beer_cost

end
