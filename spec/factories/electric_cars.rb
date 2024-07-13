# frozen_string_literal: false

# factories/electric_cars.rb
FactoryBot.define do
  factory :electric_car do
    make { 'KIA' }
    model { 'Forte HB Black' }
    year { 2017 }

    initialize_with { new(make, model, year) }
  end
end
