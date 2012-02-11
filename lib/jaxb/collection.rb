module Jaxb
  class Collection 
    # instances of the Java representation for XML content.
    attr_reader :data_type

    # List<String> - Java::JavaUtil::ArrayList
    attr_reader :list

    def update( array )
      array.each {|item| add( item ) }
    end

    def add( item )
      # if the input is a JRuby wrapper object, then add the object's @data_type
      if item.respond_to?( 'data_type' ) then
        @list.add( item.data_type )
      else
        @list.add( item )
      end
    end
  end
end
