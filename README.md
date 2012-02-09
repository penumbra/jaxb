# JRuby and JAXB: Java Architecture for XML Binding

## About
This demonstrates how JRuby may be used to control JAXB classes.  It was inspired by Jason Gilman's [MagicWebService on github](https://github.com/Element84/magic_web_service "MagicWebSerivce")

This example code focuses on Building and Marshalling and XML document
[see JAXB Tutorial](http://jaxb.java.net/tutorial/section_4_1-Building-and-Marshalling-an-XML-Document.html)

## JAXB
[JAXB](jaxb.java.net) JAXB is an acronym derived from Java Architecture for XML Binding. It constitutes a convenient framework for processing XML documents, providing significant benefits as compared to previously available methods such as the one following the Document Object Model (DOM). (from JAXB Tutorial)

The JAXB runtime library, supported with the code generated by the Binding Compiler (XJC), provides methods for unmarshalling a document from various sources as well as for marshalling a content tree to various destinations. JAXB also supports marshalling and unmarshalling for SAX, the Simple API for XML. (from JAXB Tutorial)

JAXB uses Java's annotations for augmenting the generated classes with additional information that bridges the gap between what is decribed by an XML schema and the information available (via Java's reflection mechanisms) from a set of Java class definitions. Adding such annotations to existing Java classes prepares them for being used by JAXB's runtime. (from JAXB Tutorial)

## Process Overview
The JAXB compiler xjc was used to generate Java source files from ''books.xsd'':

 + Books.java - represents a collection of BookType instances
 + BookType.java - represents a book (isbn, name, authors, etc)
 + BookCategoryType.java - an enumerated list to represent a book's category
 + ObjectFactory.java - used at runtime to genereate instances of all of the above clases

An ant build.xml supports the Java code generation and compilation.

## Building the Example
### Pre-requisites 

* JAXB 2.2.4 (http://jaxb.java.net)
* Apache Ant 1.8.2 (http://ant.apache.org/)
* JDK 1.6 (http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* JRuby 1.6.5 (http:://jruby.org)

### Clone Repo
* clone repo 

### Update JAXB path in ant build and JRuby startup script
* update ./build.xml to point to your jaxb.home
* update paths in bin/example.rb

### Compile Java Classes
* ant compile
* ant build-jar

### Run JRuby
* jruby bin/example.rb

## Schema
The following ''book.xsd'' schema used as the basis for this example.  The schema resides in the schema folder:

```xml
<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
           xmlns:jaxb="http://java.sun.com/xml/ns/jaxb" jaxb:version="1.0">

<xs:element name ="books">
   <xs:complexType>
      <xs:sequence>
        <xs:element name="book" type="bookType" minOccurs="1" maxOccurs="unbounded"/>
      </xs:sequence>
   </xs:complexType>
</xs:element>

<xs:complexType name="bookType">
  <xs:sequence>
    <xs:element name="name" type="xs:string"/>
    <xs:element name="ISBN" type="xs:long"/>
    <xs:element name="price" type="xs:string"/>
    <xs:element name="authors" >
      <xs:complexType>
        <xs:sequence>
           <xs:element name="authorName" type="xs:string" minOccurs="1"
                maxOccurs="unbounded"/>
        </xs:sequence>
      </xs:complexType>
    </xs:element>
    <xs:element name="description" type="xs:string"  minOccurs="0"/>
    <xs:element name="promotion">
       <xs:complexType>
         <xs:choice>
           <xs:element name="Discount" type="xs:string" />
           <xs:element name="None" type="xs:string"/>
         </xs:choice>
       </xs:complexType>
    </xs:element>
    <xs:element name="publicationDate" type="xs:date"/>
    <xs:element name="bookCategory"> 
       <xs:simpleType>
         <xs:restriction base="xs:NCName">
           <xs:enumeration value="magazine" />
           <xs:enumeration value="novel" />
           <xs:enumeration value="fiction" />
           <xs:enumeration value="other" />
         </xs:restriction>
        </xs:simpleType>
     </xs:element>
  </xs:sequence>
  <xs:attribute name="itemId" type="xs:string" />
</xs:complexType>

<xs:simpleType name="bookCategoryType" >
   <xs:restriction base="xs:string">
      <xs:enumeration value="magazine" />
      <xs:enumeration value="novel" />
      <xs:enumeration value="fiction" />
      <xs:enumeration value="other" />
   </xs:restriction>
</xs:simpleType>
</xs:schema>

</pre>
```

## JRuby
Using Ruby metaprogramming techniques, it becomes possible to interact with the JAXB classes (see list above) using native Ruby objects, while maintaining the ability to readily marshal the JAXB objects into XML.

```ruby
metaprogramming_ruby = { 
  :item_id => '308', 
  :name => 'Metaprogramming Ruby', 
  :isbn => 1934356476, 
  :price => '$39.95',
  :authors => ['Paulo Perrotta'],
  :description => 'Ruby inherits characteristics from various languages — Lisp, Smalltalk ' +
    ', C, and Perl, to name a few.  Metaprogramming comes from Lisp ' +
    '(and Smalltalk).  It’s a bit like magic, which makes something ' +
    'astonishing possible.'}

ex = Example.new
ex.add( metaprogramming_ruby )
ex.write_xml('book.xml')
```

# XML Output

The following XML was generated by the JAXB marshall operation

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<books>
    <book itemId="307">
        <name>Agile Web Development with Rails</name>
        <ISBN>9780977616633</ISBN>
        <price>$29.95</price>
        <authors>
            <authorName>Sam Ruby</authorName>
            <authorName>Dave Thomas</authorName>
            <authorName>David Heinemeier Hansson</authorName>
        </authors>
        <description>Ruby on Rails is a framework that makes it easier to develop, deploy, and maintain web applications. During the months that followed its initial release, Rails went from being an unknown toy to being a worldwide phenomenon, and more important, it has become the framework of choice for the implementation of a wide range of so-called Web 2.0 applications.</description>
    </book>
    <book itemId="308">
        <name>Metaprogramming Ruby</name>
        <ISBN>1934356476</ISBN>
        <price>$39.95</price>
        <authors>
            <authorName>Paulo Perrotta</authorName>
        </authors>
        <description>Ruby inherits characteristics from various languages — Lisp, Smalltalk , C, and Perl, to name a few.  Metaprogramming comes from Lisp (and Smalltalk).  It’s a bit like magic, which makes something astonishing possible.</description>
    </book>
    <book itemId="309">
        <name>Programming the Semantic Web</name>
        <ISBN>596153813</ISBN>
        <price>$19.95</price>
        <authors>
            <authorName>Toby Segaram</authorName>
            <authorName>Colin Evans</authorName>
            <authorName>Jamie Taylor</authorName>
        </authors>
    </book>
</books>
```
