require "byebug"

class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss) #this defaults the assignment of args to instance variables of super class
    @employees = employees # this is extended for Manager class
  end


#override the superclass method #bonus
  def bonus(multiplier)
    @bonus = multiplier * Manager.bonus_calc(@employees)
  end

  private_class_method :bonus_calc

#created class method to calculate the bonus of based on all salaries of employees

# try to make private because it doesnt need to ne accessible outside the class/ use bonus to call it instead
  def self.bonus_calc(subordinates)
    sum = 0

    subordinates.each do |minion|
      if minion.is_a?(Manager)
        sum += minion.salary + Manager.bonus_calc(minion.employees)
      else
        sum += minion.salary
      end
    end
    sum
  end

end
