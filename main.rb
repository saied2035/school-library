require './app'

def main
  puts "\nWelcome to School Library App!\n"
  app = App.new
  loop do
    app.run
  end
end

main
