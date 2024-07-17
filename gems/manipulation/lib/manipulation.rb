module Manipulation
  def self.to_reverse(string)
    string.reverse
  end

  def self.to_uppercase(string)
    string.upcase
  end

  def self.palindrome?(string)
    string.eql? string.reverse
  end
end

# Exercise 3: String Manipulation Gem
# Create a gem named StringManipulator that provides methods for:
# - Reversing a string.
# - Converting a string to uppercase.
# - Checking if a string is a palindrome.
# Write RSpec tests to ensure each method works as expected.
# Steps:
# Create the gem structure.
# Implement methods in StringManipulator module.
# Write RSpec tests for each method.