require './lib/prices'

class Pizza
  include Prices

  def initialize(size, type, crust)
    @size  = size
    @type  = type
    @crust = crust
  end

  def full_order
    order = {
      size: @size,
      type: @type,
      crust: @crust
    }
  end

  def calculate_price
    total = 0
    total += pizza_prices[:size][@size] + pizza_prices[:crust][@crust]
    case @type
    when "cheese" then total += pizza_prices[:type][@type]
    else
      total += pizza_prices[:type]["special"]
    end
  end

end
