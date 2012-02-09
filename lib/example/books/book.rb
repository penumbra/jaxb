module Books
  class Book
    attr_reader :book_type  # book_type is the example.books.BookType object
    attr_reader :authors    # authors.authors_type is a BookType.Authors object

    def initialize
      of = Java::example::books::ObjectFactory.new
      @book_type = of.create_book_type

      set_authors_type
    end

    def method_missing(meth, *args, &block)
      if meth == :authors=
        # author names are stored in @authors attr_reader
        args[0].each do |author| 
          @authors.add(author)
        end
      else
        # pass the call to book_type
        @book_type.send(meth, args[0])
      end
    rescue Exception => ex
      # You *must* call super if you don't handle the
      # method, otherwise you'll mess up Ruby's method lookup.
      puts "Exception calling #{meth} => #{ex}"
      super
    end

  private
    def set_authors_type
      @authors = Authors.new

      # link the BookType.Authors object to this Ruby objects' BookType object
      @book_type.set_authors(@authors.authors_type)
    end
  end
end
