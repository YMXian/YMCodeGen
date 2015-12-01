#encoding: utf-8

require 'rubygems'
require 'bundler/setup'

require 'active_support/core_ext/array'

class KissShot
  autoload :VERSION, 'kiss_shot/version'

  autoload :Spec, 'kiss_shot/spec'
  autoload :ObjC, 'kiss_shot/objc'
end
