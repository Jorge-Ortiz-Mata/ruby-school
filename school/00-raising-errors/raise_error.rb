class YorchException < StandardError; end

class Car
  def initialize(name, year)
    @name = name
    @year = year
  end

  def show_name
    raise YorchException, 'The name of the car was not printed because is empty' if @name.nil?

    p "The name of the car is: #{@name}"
  end
end

begin
  car_one = Car.new('Kia Forte HB', '2017')
  car_one.show_name
rescue YorchException => e
  puts e
end

begin
  car_two = Car.new(nil, 2020)
  car_two.show_name
rescue YorchException => e
  puts e
end
