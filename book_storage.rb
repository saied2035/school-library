require 'json'
require './book'
# book storage
class BookStorage
  attr_reader :book_list

  def initialize
    @book_list = []
  end

  def presaved_books
    File.exist?('./books.json') && (
    books = JSON.parse(File.read('./books.json'))['books']
    books.each do |data|
      book = Book.new(data['title'], data['author'])
      @book_list.push(book)
    end
  )
    File.write('books.json', '{"books":[]}') unless File.exist?('./books.json')
    @book_list
  end

  def add_book(title, author)
    book = Book.new(title, author)
    @book_list.push(book)
  end

  def store_books
    file = File.read('./books.json')
    parsed_json = JSON.parse(file)
    edit = []
    @book_list.length != parsed_json['books'].length && @book_list.length.positive? && (
    @book_list.each do |book|
      title = book.title
      author = book.author
      edit = parsed_json['books'].push({ 'title' => title, 'author' => author })
    end
    File.write('./books.json', JSON.pretty_generate({ books: edit })))
  end
end
