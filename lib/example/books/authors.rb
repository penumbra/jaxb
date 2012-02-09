module Books
  class Authors
    attr_reader :authors_type

    def initialize
      of = Java::example::books::ObjectFactory.new
      @authors_type = of.create_book_type_authors
    end

    def add(author_name)
      @authors_type.get_author_name.add(author_name)
    end
  end
end
