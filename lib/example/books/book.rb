module Books
  class Book
    # book_type is the example.books.BookType object
    attr_reader :book_type  

    # authors.authors_type is a BookType.Authors object
    attr_reader :authors    

    # promotion.promotion_type is a BookType.Promotion object
    attr_reader :promotion  

    def initialize
      of = Java::example::books::ObjectFactory.new
      @book_type = of.create_book_type

      # attr_readers are created but not yet linked to @book_type
      @promotion = Promotion.new
      @authors = Authors.new
    end

    # convert key (e.g :name, :isbn, etc) to key= (e.g. :name=, :isbn=, etc)
    # to invoke 'method_missing' using the modified key and value
    def update( book_data )
      book_data.each do |key, value|
        method = key.to_s + "="
        send( method.to_sym, value)
      end
    end 
 
    def method_missing(method, *args, &block)
      if method == :authors=
        @authors.update(args[0])
        # link the BookType.Authors object to this Ruby objects' BookType object
        @book_type.set_authors(@authors.authors_type)
      elsif method == :promotion=
        @promotion.update( args[0] )
        # link the BookType.Promotion object to this Ruby objects' BookType object
        @book_type.set_promotion(@promotion.promotion_type)
      else
        # pass the call to book_type
        @book_type.send(method, args[0])
      end
    rescue Exception => ex
      # You *must* call super if you don't handle the
      # method, otherwise you'll mess up Ruby's method lookup.
      puts "Exception calling #{method} => #{ex}"
      super
    end
  end
end
