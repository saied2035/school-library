# frozen_string_literal: true

require './app'

def main
  puts "\nWelcome to School Library App!\n"
  app = App.new
  loop do
    app.display_choices
    app.run
  end
end

main
