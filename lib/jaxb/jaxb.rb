require 'java'

require 'jaxb-api.jar'
require 'jaxb-impl.jar'
require 'activation.jar'
require 'jsr173_1.0_api.jar'

java_import 'javax.xml.bind.JAXBContext'
java_import 'javax.xml.bind.JAXBException'
java_import 'javax.xml.bind.Marshaller'

module Jaxb
  def marshall(object, class_path, file_name)
    ctx = JAXBContext.new_instance(class_path)

    marshaller = ctx.create_marshaller
    marshaller.set_property(Marshaller.JAXB_FORMATTED_OUTPUT, true)

    # output Java objects to file_name as XML
    java_file = Java::JavaIo::File.new(file_name)
    marshaller.marshal(object, java_file)
  rescue JAXBException => ex
    puts "Exception marshalling #{class_path} to file: #{ex}"
  end
end
