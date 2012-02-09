require 'java'

# JAXB 2.2.4 update 1 classes (see http://jaxb.java.net) 
require 'jaxb-api.jar'
require 'jaxb-impl.jar'
require 'activation.jar'
require 'jsr173_1.0_api.jar'

# java_import is the newest way to import a class
java_import 'javax.xml.bind.JAXBContext'
java_import 'javax.xml.bind.JAXBException'
java_import 'javax.xml.bind.Marshaller'

module Jaxb
  def marshall(object, class_path)
    ctx = JAXBContext.new_instance(class_path)

    # The Marshaller class is responsible for governing the process 
    # of serializing Java content trees back into XML data. 
    marshaller = ctx.create_marshaller
    marshaller.set_property(Marshaller.JAXB_FORMATTED_OUTPUT, true)

    # capture marshalled XML data to a StringBuffer
    sw = Java::JavaIo::StringWriter.new

    # output Java objects to XML
    marshaller.marshal(object, sw)
    sw.to_string
  rescue JAXBException => ex
    return "Exception marshalling #{class_path} to xml: #{ex}"
  end
end
