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
  # @param superklass [String, Symbol] superclass
  # @param protocols [String, Symbol, Array] protocols this interface implemented
  # @return self
  def objc_interface(name, superklass = "NSObject", protocols = nil)
    line "@interface #{name} : #{superklass}#{_objc_diamond_array(Array.wrap(protocols))}"
    yield if block_given?
    line "@end"
    self
  end

  # interface raw bracket for instance variable
  # @return self
  def objc_interface_bracket
    line "{"
    indent_up
    yield if block_given?
    indent_down
    line "}"
    self
  end

  # Interface instance variable
  # @param name [String] name of instance variable
  # @param type [String, Symbol, Array] type of instance variable
  # @return self
  def objc_interface_variable(name, type = 'NSInteger')
    line "#{Array.wrap(type).join(" ")} #{name};"
  end

  # Append @property
  #
  # @param name [String] property name
  # @param type [String, Array] property type, joined with ` `
  # @param options [String, Array] array of options, such as `nonatomic`, joined with ','
  # @return self
  def objc_property(name, type, options = ['nonatomic', 'strong'])
    line "@property #{_objc_bracket_array(Array.wrap(options))} #{Array.wrap(type).join(" ")} #{name};"
    self
  end
end
