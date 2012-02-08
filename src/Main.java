
import java.io.File;
import java.util.Collection;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import example.books.*;

public class Main { 
   public static void main(String[] args) {
      ObjectFactory objFactory = new ObjectFactory();

      Books books = objFactory.createBooks();
      BookType book = objFactory.createBookType();   

      List<BookType> bookList = books.getBook();
      bookList.add( book );

      // Then use set methods in the created objects to specify data values. For example:
      book.setItemId("307");
      book.setName("JAXB today and beyond"); 
      book.setISBN(123456789L);

      try {
         File file = new File("books.xml");
         JAXBContext jaxbContext = JAXBContext.newInstance("example.books");
         Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

         // output pretty printed
         jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
 
         // output to books.xml
         jaxbMarshaller.marshal(books, file);
      } catch (JAXBException e) {
         e.printStackTrace();
      }
   }
}
