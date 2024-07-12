module Drivable
  def drive
    'Driving!'
  end
end

class Car
  include Drivable
  attr_reader :year, :make, :model

  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
  end

  def self.start_engine
    'Engine started!'
  end

  def info
    "The car' details are: \n Make: #{@make}\n Model: #{@model}\n Year: #{@year}"
  end
end

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

class ElectricCar < Car
  def battery_range
    'The battery range of the car is 100 to 150'
  end

  def info
    battery_range
  end
end

# car = Car.new('KIA', 'Forte HB Black', 2017)
# puts car.info
# puts Car.start_engine
# puts car.make
# puts car.model
# puts car.year 

# person = Person.new('Jorge', 25)
# # puts person.introduce
# person.buy_car('FORD', 'Focus Sedan', 2005)
# puts person.show_car

# electric_car = ElectricCar.new('CHEVROLET', 'Camaro LS', 2022)
# puts electric_car.info

car = Car.new('KIA', 'Forte HB Black', 2017)
puts car.drive
