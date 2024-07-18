# frozen_string_literal: false

require 'password_generator'

# It models the AccountPasswordGenerator class
class AccountPasswordGenerator
  include PasswordGenerator

  def initialize(email)
    @email = email
  end

  def generate_password(option, length)
    case option
    when 1
      lowercase(length)
    when 2
      lowercase_upcase(length)
    when 3
      lowercase_upcase_numbers(length)
    when 4
      lowercase_upcase_numbers_characters(length)
    else
      'The option was not valid. Please enter a valid option'
    end
  end
end
