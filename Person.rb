class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    return true if @age >= 18

    false
  end
  private :is_of_age?

  def can_use_services?
    return true if @age >= 18 || parent_permission == true

    false
  end
end
