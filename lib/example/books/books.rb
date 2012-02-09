# provides a JAXB marshall mixin method for rendering the books collection to Xml
require 'jaxb/jaxb.rb'

module Books
  class Books
    include Jaxb

    attr_reader :books
    attr_reader :book_list  #  => Java::JavaUtil::ArrayList

    def initialize
      of = Java::example::books::ObjectFactory.new
      @books = of.create_books

      @book_list = books.get_book
    end

    def add(book)
      @book_list.add(book.book_type)
    end

    def save(file_name)
      marshall(@books, 'example.books', file_name)
    end
  end
end
