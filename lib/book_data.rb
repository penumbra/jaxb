require 'ostruct'

class BookData
  class << self
    def each
      methods = self.methods - Object.methods - ["each"]
      methods.sort.each {|method| yield( method ) }
    end

    def book1
      promo = OpenStruct.new
      promo.discount = "25%"

      ar = OpenStruct.new
      ar.item_id = '307'
      ar.name = 'Agile Web Development with Rails'
      ar.isbn =  9780977616633
      ar.price = '$29.95'
      ar.authors = ['Sam Ruby', 'Dave Thomas', 'David Heinemeier Hansson']
      ar.description = 'Ruby on Rails is a framework that makes it ' +
      'easier to develop, deploy, and maintain web applications. ' +
      'During the months that followed its initial release, Rails ' +
      'went from being an unknown toy to being a ' +
      'worldwide phenomenon, and more important, it has become the ' +
      'framework of choice for the implementation of a wide range of ' +
      'so-called Web 2.0 applications.'
      ar.promotion = promo.marshal_dump

      ar.marshal_dump
    end

    def book2
      promo = OpenStruct.new
      promo.discount = "45%"

      mr = OpenStruct.new
      mr.item_id = '308'
      mr.name = 'Metaprogramming Ruby'
      mr.isbn = 1934356476
      mr.price = '$39.95'
      mr.authors = ['Paulo Perrotta']
      mr.description = 'Ruby inherits characteristics from various ' +
      'languages — Lisp, Smalltalk, C, and Perl, to name a few.  ' +
      'Metaprogramming comes from Lisp (and Smalltalk).  It’s a bit ' +
      'like magic, which makes something astonishing possible.'
      mr.promotion = promo.marshal_dump
      mr.publication_date = '2012-02-12'

      mr.marshal_dump
    end

    def book3
      rebate = OpenStruct.new
      rebate.discount = "$5 Rebate"

      psw = OpenStruct.new
      psw.item_id = '309'
      psw.name = 'Programming the Semantic Web'
      psw.isbn = 596153813
      psw.price = '$19.95'
      psw.authors = ['Toby Segaram', 'Colin Evans', 'Jamie Taylor']
      psw.promotion = rebate.marshal_dump

      psw.marshal_dump
    end

    def book4
      promo = OpenStruct.new
      promo.none = "Free article"

      jb = OpenStruct.new
      jb.item_id = '310'
      jb.name = 'JAXB Tutorial'
      jb.authors = [ 'Ed Ort', 'Bhakti Mehta' ]
      jb.promotion = promo.marshal_dump

      jb.marshal_dump
    end
  end
end