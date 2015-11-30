#encoding: utf-8

module KissShot::ObjC::Klass
  include KissShot::ObjC::Base

  # Append @class forward declaration
  # @param name [String] class name
  # @return self
  def objc_class(name)
    line "@class #{name};"
    self
  end

  # Append @interface
  #
  # @param name [String] interface name
  # @param superklass [String] superclass
  # @param protocols [Array] protocols this interface implemented
  # @return self
  def objc_interface(name, superklass = "NSObject", protocols = [])
    line "@interface #{name} : #{superklass}#{_objc_diamond_array(protocols)}"
    yield if block_given?
    line "@end"
  end
end
