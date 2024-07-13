# frozen_string_literal: false

# It models a class electric car
require_relative 'car'

class ElectricCar < Car
  def battery_range
    'The battery of the car is 12 volts'
  end

  def info
    battery_range
  end
end
