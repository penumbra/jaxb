# provides a #to_xml mixin method for rendering the books collection to Xml
require 'jaxb/marshal.rb'
# Jaxb module's Collection class supports operations on @list
require 'jaxb/collection.rb'

# ObjectFactory allows you to programatically construct
# new instances of the Java representation for XML content.
java_import 'example.books.ObjectFactory'

module Books
  class Books < Jaxb::Collection
    # mixin the to_xml method as @data_type is the @XmlRootElement
    include Jaxb::Marshal

    def initialize
      @data_type = ObjectFactory.new.create_books
      @list = @data_type.get_book

      # used by Jaxb::Marshal#to_xml
      @class_path = 'example.books'
    end
  end
end
