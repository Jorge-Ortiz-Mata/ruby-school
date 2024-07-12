class Vehicle 
  def initialize(make, model)
    @make = make
    @model = model
  end
end

class Car < Vehicle
  def initialize(make, model, year)
    super(make, model)
    @year = year
  end

  def details
    "The car' details I purchase are: \n Make: #{@make}\n Model: #{@model}\n Year: #{@year}"
  end
end

class Employee
  def work
    'Working'
  end
end

class Manager < Employee
  def work
    'Managing and ' + super
  end
end

class Bird 
  def fly(speed)
    "Flying at #{speed} mph"
  end
end

class Eagle < Bird
  def fly
    super(30)
  end
end

class Appliance
  def initialize(brand, model)
    @brand = brand
    @model = model
  end
end

class WashingMachine < Appliance
  attr_reader :capacity

  def initialize(brand, model)
    super
    @capacity = 0
  end

  def set_capacity
    @capacity = 10
  end
end

class Person
  def initialize(name)
    @name = name
  end

  def greet
    "Hello, I am #{@name}"
  end
end

class Student < Person
  attr_reader :grade

  def initialize(name)
    super(name)
    @grade = 10
  end
  
  def greet
    super + " and my grade is #{@grade}"
  end
end
