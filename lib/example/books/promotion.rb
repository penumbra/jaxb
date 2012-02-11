# Marshal module properties class supports setting properties on @data_type
require 'jaxb/properties.rb'

# ObjectFactory allows you to programatically construct
# new instances of the Java representation for XML content.
java_import 'example.books.ObjectFactory'

module Books
  class Promotion < Jaxb::Properties
    def initialize
      @data_type = ObjectFactory.new.create_book_type_promotion
    end
  end
end
