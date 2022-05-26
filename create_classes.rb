require './book_storage'
require './rental_storage'
require './people_store'
# create classes
class CreateClasses
  attr_reader :book_storage, :people_storage, :rental_storage

  def initialize
    @book_storage = BookStorage.new
    @people_storage = PeopleStore.new
    @rental_storage = RentalStorage.new
    people_list = @people_storage.load_people
    book_list = @book_storage.presaved_books
    @rental_storage.presaved_rentals(book_list, people_list)
  end

  def add_book(title, author)
    @book_storage.add_book(title, author)
  end

  def add_student(age, name, parent_permission)
    @people_storage.add_student(age, name, parent_permission)
  end

  def add_teacher(age, name, specialization)
    @people_storage.add_teacher(age, name, specialization)
  end

  def add_rental(date, book_num, person_num)
    book = @book_storage.book_list[book_num - 1]
    person = @people_storage.people_list[person_num - 1][:value]
    rental_storage.add_rental(date, book, person)
  end
end
