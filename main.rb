require './app'
def create_app
	return App.new()
end

def display_app
   puts ["1 - List all books","2 - List all people","3 - Create a person"
         "4 - Create a book","5 - Create a rental","6 - List all rentals for a given person id"
         "7 - Exit"]
end

def choose_action(app)
	decision = gets.chomp
	case decision
    when 1
	end	
end         	