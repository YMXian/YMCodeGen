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

  # Append @implementation
  #
  # @param name [String] class name
  # @return self
  def objc_implementation(name)
    line "@implementation #{name}"
    yield if block_given?
    line "@end"
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

  # Append method
  #
  # @param static [true, false] if is a static(class) method
  # @param return_type [String, Symbol, Array] return type
  # @param components remaining components
  def objc_method(*args)
    sign = args.shift ? "+" : "-"
    type = args.shift
      raw "#{sign} (#{Array.wrap(type).join(" ")})", true
    if args.count == 1
      raw " "
      raw "#{args.shift}"
    else
      raise "Bad args for #objc_method" unless args.count % 3 == 0
      args.each_slice(3) do |slice|
        raw " "
        raw slice[0]
        raw ":"
        raw "(#{Array.wrap(slice[1]).join(" ")})"
        raw slice[2]
      end
    end
    if block_given?
      raw " {\n"
      indent_up
      yield
      indent_down
      line "}"
    else
      raw ";\n"
    end
    self
  end
end
