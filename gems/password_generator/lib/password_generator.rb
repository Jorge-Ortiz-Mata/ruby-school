# frozen_string_literal: false

# It models the PasswordGenerator module
module PasswordGenerator
  def lowercase(length)
    password_conditions(length, lower_alphabet_array, /^[a-z]+$/)
  end

  def lowercase_upcase(length)
    password_conditions(length, lower_upcase_alphabet_array, /^[a-zA-Z]+$/)
  end

  def lowercase_upcase_numbers(length)
    password_conditions(length, alphanumeric_array, /^[a-zA-Z0-9]+$/)
  end

  def lowercase_upcase_numbers_characters(length)
    password_conditions(length, alphanumeric_array, /^[a-zA-Z0-9!@#$%-&*()]+$/)
  end

  private

  def password_conditions(length, array_conditions, regex)
    password = ''
    is_valid = false

    loop do
      password = random_password(length, array_conditions)
      is_valid = true if password =~ regex
      break if is_valid
    end

    password
  end

  def random_password(length, password_format)
    password = ''

    length.times do
      random_number = rand(password_format.length - 1)

      password += password_format[random_number]
    end

    password
  end

  def lower_alphabet_array
    @lower_alphabet_array ||= ('a'..'z').to_a
  end

  def lower_upcase_alphabet_array
    @lower_upcase_alphabet_array ||= ('a'..'z').to_a + ('A'..'Z').to_a
  end

  def alphanumeric_array
    @alphanumeric_array ||= ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  end

  def alphanumeric_with_special_chars_array
    @alphanumeric_with_special_chars_array ||=
      ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + %w[! @ # $ % - & * ( )]
  end
end
