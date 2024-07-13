# frozen_string_literal: false

# factories/people.rb
FactoryBot.define do
  factory :person do
    name { 'Jorge' }
    age { 25 }

    initialize_with { new(name, age) }
  end
end
