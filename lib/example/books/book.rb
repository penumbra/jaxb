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
  
    # author names are stored in @authors
    def update_authors(authors)
      authors.each do |author| 
        @authors.add(author)
      end

      # link the BookType.Authors object to this Ruby objects' BookType object
      @book_type.set_authors(@authors.authors_type)
    end

    def update_promotion(data)
      set_promotion

      data.each do |key, value|
        meth = key.to_s + '='

        @promotion.send(meth.to_sym, value)
      end
      
      # link the BookType.Promotion object to this Ruby objects' BookType object
      @book_type.set_promotion(@promotion.promotion_type)
    end

    def method_missing(meth, *args, &block)
      if meth == :authors=
        update_authors(args[0])
      elsif meth == :promotion=
        update_promotion( args[0] )
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
  end
end
