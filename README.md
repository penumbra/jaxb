# JRuby and JAXB: Java Architecture for XML Binding

## About
This demonstrates how JRuby may be used to control JAXB classes.  It was inspired by Jason Gilman's [MagicWebService on github](https://github.com/Element84/magic_web_service "MagicWebSerivce")

## Process
The JAXB compiler xjc was used to generate Java source files from ''books.xsd'':
* Books.java
* BookType.java
* BookCategoryType.java
* ObjectFactory.java

An ant build.xml supports the Java code generation and compilation.

## Schema
The following ''book.xsd'' schema used as the basis for this example.  The schema resides in the schema folder:

<pre>
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

## JRuby

