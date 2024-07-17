require 'date'
require 'bundler/setup'
require 'manipulation'
require 'date_time_utils'

# puts Manipulation.to_reverse 'Jorge'
# puts Manipulation.to_uppercase 'Jorge'
# puts Manipulation.palindrome? 'reconocer'

days = DateTimeUtils.two_dates_difference('2022-01-01', '2022-02-23')
puts "#{days} days"
puts DateTimeUtils.yyyy_mm_dd_format(Date.today)
puts DateTimeUtils.add_days('01-01-2022', 5)
