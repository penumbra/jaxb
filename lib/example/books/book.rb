# Jaxb module Properties class supports setting properties on @data_type
require 'jaxb/properties.rb'

# ObjectFactory allows you to programatically construct
# new instances of the Java representation for XML content.
java_import 'example.books.ObjectFactory'

module Books
  class Book < Jaxb::Properties
    attr_reader :authors       # BookType.Authors
    attr_reader :promotion    # BookType.Promotion

    def initialize( book = nil )
      @data_type = ObjectFactory.new.create_book_type

      # initially, these are not linked to self.data_type
      @promotion = Promotion.new
      @authors = Authors.new

      # set the various properties for this instance using book
      self.update( book ) unless book == nil
    end

    def method_missing(method, *args, &block)
      if method == :authors=
        @authors.update( args[0] )
        # link the BookType.Authors object to self.data_type
        @data_type.set_authors(@authors.data_type)
      elsif method == :promotion=
        @promotion.update( args[0] )
        # link the BookType.Promotion object to self.data_type
        @data_type.set_promotion(@promotion.data_type)
      else
        # use Jaxb::Properties method_missing
        super
      end
    end
  end
end