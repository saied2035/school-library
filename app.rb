require './display'
require './user_interaction'
# app class
class App
  attr_reader :create_classes

  def initialize
    @user_interaction = UserInteraction.new
    @create_classes = @user_interaction.create_classes
    @book_storage = @create_classes.book_storage
    @people_storage = @create_classes.people_storage
    @rental_storage = @create_classes.rental_storage
  end

  def display_choices
    puts "\nPlease choose an option by enter a number:"
    puts ['1 - List all books', '2 - List all people', '3 - Create a person',
          '4 - Create a book', '5 - Create a rental', '6 - List all rentals for a given person id', '7 - Exit']
  end

  def run
    decision = gets.chomp
    puts 'please choose of the list' unless (1..7).include?(decision.to_i)
    actions(decision)
  end

  def display_books
    Display.new.display_books(@book_storage.book_list)
  end

  def display_people
    Display.new.display_people(@people_storage.people_list)
  end

  def create_people
    @user_interaction.create_people
  end

  def create_book
    @user_interaction.create_book
  end

  def handle_rental
    @user_interaction.handle_rental
  end

  def list_rental_for_person
    Display.new.display_rentals(@rental_storage.rental_list)
  end

  def exit_program
    puts 'Thank you for using this app!'
    @book_storage.book_list.length.positive? && @book_storage.store_books

    @people_storage.people_list.length.positive? && @people_storage.store_people

    @rental_storage.rental_list.length.positive? && @rental_storage.store_rentals

    exit
  end

  private

  def actions(decision)
    methods = [
      method(:display_books), method(:display_people), method(:create_people), method(:create_book),
      method(:handle_rental), method(:list_rental_for_person), method(:exit_program)
    ]
    (1..7).include?(decision.to_i) && methods[decision.to_i - 1].call
  end
end
