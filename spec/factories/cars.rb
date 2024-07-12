# factories/cars.rb
FactoryBot.define do
  factory :car do
    make { 'KIA' }
    model { 'Forte HB Black' }
    year { 2017 }

    initialize_with { new(make, model, year) }
  end
end
