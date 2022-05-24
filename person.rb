# frozen_string_literal: true

require './nameable'
require './rental'
# main class
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    return true if of_age? || parent_permission == true

    false
  end

  def correct_name
    @name
  end

  def person_rentals(rental)
    rental.instance_of?(Rental) && !@rentals.include?(rental) &&
      @rentals.push(rental)
    @rentals
  end

  def of_age?
    return true if @age >= 18

    false
  end

  private :of_age?
end
