module Constants

  BOTTLE_750ML = 750
  BOTTLE_500ML = 500
  BOTTLE_375ML = 375

  BOTTLE_22OZ = 22
  BOTTLE_12OZ = 12
  CAN_16OZ = 16

  BOX_3L = 3000

  UNITS_IN_6PK = 6
  UNITS_IN_4PK = 4
  UNITS_IN_12PK = 12

  WINE_SERVING_OZ = 5
  SPIRITS_SERVING_OZ = 1.5
  BEER_SERVING_OZ = 12

  SERVINGS_CONVERSION = 60
  ML_TO_OZ_CONVERSION = 0.033814

  SERVINGS_PER_BOTTLE_OF_WINE = (BOTTLE_750ML*ML_TO_OZ_CONVERSION)/WINE_SERVING_OZ
  SERVINGS_PER_BOTTLE_OF_SPIRITS = (BOTTLE_750ML*ML_TO_OZ_CONVERSION)/SPIRITS_SERVING_OZ
  SERVINGS_PER_6PK_12OZ_OF_BEER = (BOTTLE_12OZ*UNITS_IN_6PK)/BOTTLE_12OZ
  SERVINGS_PER_4PK_16OZ_OF_BEER = (CAN_16OZ*UNITS_IN_4PK)/BOTTLE_12OZ

  DISPLAY_PACKAGING = {
    "750ml" => "750ml bottle",
    "4pk-16oz" => "4pk-16oz bottle/can",
    "6pk-12oz" => "6pk-12oz bottle/can",
    "16oz" => "16oz can",
    "22oz" => "22oz bottle",
    "500ml" => "500ml bottle",
    "375ml" => "375ml bottle",
    "12pk-12oz" => "12pk-12oz bottle/can",
    "6pk-16oz" => "6pk-16oz bottle/can",
    "3L" => "3 liter box"
  }

  def calculate_volume(in_packaging, in_volume, in_unit)

    case in_packaging
    when "750ml"
      volume = BOTTLE_750ML*ML_TO_OZ_CONVERSION
    when "4pk-16oz"
      volume = UNITS_IN_4PK*CAN_16OZ
    when "6pk-12oz"
      volume = UNITS_IN_6PK*BOTTLE_12OZ
    when "16oz"
      volume = CAN_16OZ
    when "22oz"
      volume = BOTTLE_22OZ
    when "500ml"
      volume = BOTTLE_500ML*ML_TO_OZ_CONVERSION
    when "375ml"
      volume = BOTTLE_375ML*ML_TO_OZ_CONVERSION
    when "12pk-12oz"
      volume = UNITS_IN_12PK*BOTTLE_12OZ
    when "6pk-16oz"
      volume = UNITS_IN_6PK*CAN_16OZ
    when "3L"
      volume = BOX_3L*ML_TO_OZ_CONVERSION
    else
      if in_unit == "ml"
        volume = in_volume*ML_TO_OZ_CONVERSION
      else
        volume = in_volume
      end
    end

    return volume
  end
  module_function :calculate_volume

  def calculate_servings(in_abv, in_volume)
    number_of_servings = ((in_volume*in_abv)/SERVINGS_CONVERSION).round(2)
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
