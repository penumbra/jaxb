require 'ostruct'

class ExampleData
  def ExampleData.book1
    ar = OpenStruct.new
    ar.item_id = '307'
    ar.name = 'Agile Web Development with Rails'
    ar.isbn =  9780977616633 
    ar.price = '$29.95' 
    ar.authors = ['Sam Ruby', 'Dave Thomas', 'David Heinemeier Hansson']
    ar.description = 'Ruby on Rails is a framework that makes it easier to develop, deploy, ' + 
    'and maintain web applications. During the months that followed its ' +
    'initial release, Rails went from being an unknown toy to being a ' +
    'worldwide phenomenon, and more important, it has become the ' +
    'framework of choice for the implementation of a wide range of ' +
    'so-called Web 2.0 applications.'
    ar.promotion = { :discount => "25%" }

    ar.marshal_dump
  end

  def ExampleData.book2
    mr = OpenStruct.new
    mr.item_id = '308'
    mr.name = 'Metaprogramming Ruby'
    mr.isbn = 1934356476 
    mr.price = '$39.95' 
    mr.authors = ['Paulo Perrotta']
    mr.description = 'Ruby inherits characteristics from various languages — Lisp, Smalltalk ' +
    ', C, and Perl, to name a few.  Metaprogramming comes from Lisp ' +
    '(and Smalltalk).  It’s a bit like magic, which makes something ' +
    'astonishing possible.'
    mr.promotion = { :none => "None" }
    mr.marshal_dump
  end

  def ExampleData.book3
    psw = OpenStruct.new
    psw.item_id = '309'
    psw.name = 'Programming the Semantic Web'
    psw.isbn = 596153813
    psw.price = '$19.95'
    psw.authors = ['Toby Segaram', 'Colin Evans', 'Jamie Taylor']
    psw.promotion = { :discount => "$5 Rebate" }
    psw.marshal_dump
  end
end
