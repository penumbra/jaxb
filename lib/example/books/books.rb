require 'java'
require 'books.jar'
require 'jaxb/jaxb.rb'

module Books
  class Books
    include Jaxb    # mixin the ability to marshall to Xml

    attr_reader :books
    attr_reader :book_list  #  => Java::JavaUtil::ArrayList

    def initialize
      # books.xsd binding to example.books.*
      of = Java::example::books::ObjectFactory.new

      @books = of.create_books
      @book_list = books.get_book
    end

    def add_book(book)
      @book_list.add(book.book_type)
    end

    def save(file_name)
      marshall(@books, 'example.books', file_name)
    end
  end
end