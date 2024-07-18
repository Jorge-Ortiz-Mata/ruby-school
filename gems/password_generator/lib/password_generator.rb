# frozen_string_literal: false

# It models the PasswordGenerator module
module PasswordGenerator
  def lowercase(length)
    password = ''

    length.times do
      random_number = rand(lower_alphabet_array.length - 1)

      password += lower_alphabet_array[random_number]
    end

    password.downcase
  end

  def lowercase_upcase(length)
    password = ''

    length.times do
      random_number = rand(lower_upcase_alphabet_array.length - 1)

      password += lower_upcase_alphabet_array[random_number]
    end

    password
  end

  def lowercase_upcase_numbers(length)
    password = ''

    length.times do
      random_number = rand(alphanumeric_array.length - 1)

      password += alphanumeric_array[random_number]
    end

    password
  end

  def lowercase_upcase_numbers_characters(length)
    password = ''

    length.times do
      random_number = rand(alphanumeric_with_special_chars_array.length - 1)

      password += alphanumeric_with_special_chars_array[random_number]
    end

    password
  end

  private

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
