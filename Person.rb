# frozen_string_literal: true

# main class
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    return true if @age >= 18

    false
  end
  private :of_age?

  def can_use_services?
    return true if @age >= 18 || parent_permission == true

    false
  end
end
