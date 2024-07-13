# spec/spec_helper.rb
require 'factory_bot'
require 'byebug'
require 'simplecov'

SimpleCov.start do
  track_files 'classes/**/*.rb'
  track_files 'modules/**/*.rb'
  add_filter '/spec/' # Exclude spec files from the coverage report
end

# Require all Ruby files in the 'lib' and 'app' directories
# Dir['./{classes}/**/*.rb'].sort.each { |file| require file }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
