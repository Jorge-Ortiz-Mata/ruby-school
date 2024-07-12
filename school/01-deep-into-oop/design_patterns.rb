require 'date'

class Logger
  @instance = nil

  private_class_method :new

  def self.instance
    @instance ||= new
  end

  def log
    "This log was recorded on: #{Date.today}"
  end
end

class Counter 
  @instance = nil

  private_class_method :new

  def self.instance
    @instance ||= new
  end

  def initialize
    @counter = 10
  end

  def increment
    @counter += 1
  end

  def print_value
    "The counter value is: #{@counter}"
  end
end

counter_one = Counter.instance
counter_one.increment
counter_one.increment
counter_one.increment
puts counter_one.print_value
counter_two = Counter.instance
puts counter_two.print_value