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

      set_promotion
      set_authors_type
    end
  
    # author names are stored in @authors
    def update_authors(authors)
      authors.each do |author| 
        @authors.add(author)
      end
    end

    def update_promotion(data)
      data.each do |key, value|
        meth = key.to_s + '='

        @promotion.send(meth.to_sym, value)
      end
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

  private
    def set_promotion
      @promotion = Promotion.new
     
      @book_type.set_promotion(@promotion.promotion_type)
    end

    def set_authors_type
      @authors = Authors.new

      # link the BookType.Authors object to this Ruby objects' BookType object
      @book_type.set_authors(@authors.authors_type)
    end
  end
end
