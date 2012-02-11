# Marshal module Collections class supports operations on @list
require 'jaxb/collection.rb'

# ObjectFactory allows you to programatically construct
# new instances of the Java representation for XML content.
java_import 'example.books.ObjectFactory'

module Books
  class Authors < Jaxb::Collection
    def initialize
      @data_type = ObjectFactory.new.create_book_type_authors
      @list = @data_type.get_author_name
    end
  end
end