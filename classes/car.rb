# frozen_string_literal: false
require_relative '../modules/drivable'

# It models a class car
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
    "The car's details are: \n Make: #{@make}\n Model: #{@model}\n Year: #{@year}"
  end
end
