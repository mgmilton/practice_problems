class Customer

  def initialize(name, address, phone_number)
    @name = name
    @address = address
    @phone_number = phone_number
    @order = false
    @orders = 0
    @frequent_customer = false
    @order_dates = []
  end

  def profile
    customer_profile = {
      name:      @name,
      address:   @address,
      phone:     @phone_number
    }
  end

  def order_in_place?
    @order
  end

  def place_order(pizza, time)
    @orders += 1
    @order_dates << time
    @order = true
  end

  def order_frequency
    case
    when @orders <= 3 then @orders
    when @orders >= 3 then date_calculator
    end
  end

  def date_calculator
    count = 0
    @order_dates.each_with_index do |date, index|
      if date[index].month == date[index+1].month && date[index].year == date[index+1].year
        count += 1
      elsif date[index].day + date[index+1].day >= 30 && date[index].day + date[index+1].day <= 60 && date[index].year == date[index+1].year
        count += 1
      end
    end
    if count > 3
      @frequent_customer = true
    end
  end

  def frequent_customer?
    @frequent_customer
  end

end
