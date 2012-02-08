#!/usr/bin/env jruby

lib_dir = File.expand_path('../../lib', __FILE__)

$LOAD_PATH << lib_dir
$LOAD_PATH << '/tools/jaxb-ri-20110601/lib'

require 'example'
