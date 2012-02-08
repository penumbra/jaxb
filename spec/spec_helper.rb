lib_dir = File.expand_path('../../lib', __FILE__)
jar_dir = File.expand_path('../../jars', __FILE__)

$LOAD_PATH << lib_dir << jar_dir
$LOAD_PATH << '/tools/jaxb-ri-20110601/lib'

require 'example/books.rb'
