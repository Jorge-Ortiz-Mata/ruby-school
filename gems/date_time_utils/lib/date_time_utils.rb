require 'date'

module DateTimeUtils
  def self.two_dates_difference(string_date_one, string_date_two)
    date_one = split_and_convert_date(string_date_one)
    date_two = split_and_convert_date(string_date_two)

    (date_two - date_one).to_i
  end

  def self.yyyy_mm_dd_format(date)
    date.strftime('%Y/%m/%d')
  end

  def self.add_days(str_date, days)
    parsed = DateTime.strptime(str_date, '%d-%m-%Y')
    parsed.next_day(days)
  end

  def self.split_and_convert_date(str_date)
    array_date = str_date.split('-')
    Date.new(array_date[0].to_i, array_date[1].to_i, array_date[2].to_i)
  end
end

# Exercise 4: Date and Time Utilities Gem
# Create a gem named DateTimeUtils that provides methods for:
# - Calculating the difference in days between two dates.
# - Formatting a date in a specific format (e.g., YYYY-MM-DD).
# - Adding a specific number of days to a date.
# Write RSpec tests to ensure each method works correctly.
# Steps:
# Create the gem structure.
# Implement methods in DateTimeUtils module.
# Write RSpec tests for each method.
