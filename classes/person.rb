# frozen_string_literal: false

# It models a class person
require_relative 'car'

class Person
  def initialize(name, age)
    @name = name
    @age = age
    @car = nil
  end

  def introduce
    "Hello! I'm #{@name}"
  end

  def buy_car(make, model, year)
    @car = Car.new(make, model, year)
  end

  def show_car
    "The car' details I purchase are: \n Make: #{@car.make}\n Model: #{@car.model}\n Year: #{@car.year}"
  end
end
