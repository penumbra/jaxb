module Books
  class Authors
    attr_reader :authors_type
    attr_reader :authors_list

    def initialize
      of = Java::example::books::ObjectFactory.new
      @authors_type = of.create_book_type_authors

      # getAuthorName returns List<String> - Java::JavaUtil::ArrayList
      @authors_list = @authors_type.get_author_name
    end

    def update( author_data )
      author_data.each {|author| add( author ) }
    end

    def add( author_name )
      @authors_list.add( author_name )
    end
  end
end
