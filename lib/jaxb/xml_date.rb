require 'java'

java_import 'java.util.GregorianCalendar'
java_import 'javax.xml.datatype.DatatypeFactory'
java_import 'javax.xml.datatype.XMLGregorianCalendar'

java_import 'java.text.ParseException'
java_import 'java.text.SimpleDateFormat'
java_import 'java.util.Date'

module Jaxb
  class XmlDate
    class << self
      def parse( date_str, pattern = 'yyyy-MM-dd' )
        date = SimpleDateFormat.new( pattern ).parse( date_str )

        gcal = GregorianCalendar.new( 1900 + date.year, date.month, date.date)
        DatatypeFactory.new_instance.newXMLGregorianCalendar( gcal )
      end

      def get_date( year, month, day )
        gcal = GregorianCalendar.new( year, month - 1, day )
        DatatypeFactory.new_instance.newXMLGregorianCalendar( gcal )
      end
    end
  end
end
