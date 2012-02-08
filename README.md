# JRuby and JAXB: Java Architecture for XML Binding

## About
This demonstrates how JRuby may be used to control JAXB classes.  It was inspired by Jason Gilman's [github](https://github.com/Element84/magic_web_service "MagicWebSerivce")

## Process
The JAXB compiler xjc was used to generate Java source files from ''books.xsd'':
* Books.java
* BookType.java
* BookCategoryType.java
* ObjectFactory.java

An ant build.xml supports the Java code generation and compilation.

## JRuby

