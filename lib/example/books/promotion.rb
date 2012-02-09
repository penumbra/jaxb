module Books
  class Promotion
    attr_reader :promotion_type

    def initialize
      of = Java::example::books::ObjectFactory.new

      @promotion_type = of.create_book_type_promotion
    end
   
    def method_missing(meth, *args, &block)
      # pass the call to book_type
      @promotion_type.send(meth, args[0])
    rescue Exception => ex
      # You *must* call super if you don't handle the
      # method, otherwise you'll mess up Ruby's method lookup.
      puts "Exception calling #{meth} => #{ex}"
      super        
    end
  end
end
