module Jaxb
  class Properties
    # instances of the Java representation for XML content.
    attr_reader :data_type

    def update( hash )
      hash.each do |key, value|
        method = key.to_s + '='
        # call method_missing
        send(method.to_sym, value)
      end
    end
   
    def method_missing(method, *args, &block)
      # pass the call to data_type
      @data_type.send(method, args[0])
    rescue Exception => ex
      # You *must* call super if you don't handle the
      # method, otherwise you'll mess up Ruby's method lookup.
      puts "Exception calling #{method} => #{ex}"
      super        
    end
  end
end
