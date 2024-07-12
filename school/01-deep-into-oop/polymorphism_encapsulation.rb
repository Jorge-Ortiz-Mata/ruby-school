class Shape
  def area
    'Calculating data'
  end
end

class Circle < Shape
  def area
    'Area of the circle'
  end
end

class Square < Shape
  def area
    'Area of the square'
  end
end

class BankAccount
  def initialize(balance)
    @balance = balance
  end

  # public
  def display_balance
    "This is your current balance in your bank account: $#{@balance.to_f} USD"
  end

  def deposit
    @balance += 5000
  end

  def withdraw
    @balance -= 500
  end

  # Private
  private

  attr_reader :balance
end

class User
  protected

  def password
    'Your password is: myDummyPassword12345'
  end
end

class Admin < User
  def show_password
    password
  end
end

class Employee 
  def calculate_salary
    'Calculating salary'
  end
end

class FullTimeEmployee < Employee
  def initialize(salary)
    @salary = salary
  end

  def calculate_salary
    @salary *= 8
  end

  private

  attr_reader :salary
end

class PartTimeEmployee < Employee
  def initialize(salary)
    @salary = salary
  end

  def calculate_salary
    @salary *= 4
  end

  private

  attr_reader :salary
end
