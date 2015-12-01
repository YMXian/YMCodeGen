#encoding: utf-8

module KissShot::ObjC::Protocol
  include KissShot::ObjC::Base

  # Add line for @required
  # @return self
  def objc_protocol_required
    line "@required"
    self
  end

  # Add line for @optional
  # @return self
  def objc_protocol_optional
    line "@optional"
    self
  end

  # For @protocol
  # @param name [String] protocol name
  # @param supers [Array, String] super protocols, default to ['NSObject']
  # @return self
  def objc_protocol(name, supers = ["NSObject"])
    # Declare
    raw "@protocol #{name}"
    if block_given?
      # If block given, add supers, and yield
      if supers.count
        raw " #{_objc_diamond_array(Array.wrap(supers))}"
      end
      # new line, no indent
      raw "\n"
      # yield
      yield
      # add @end
      line "@end"
    else
      # if no block given, just close line with ;
      raw ";\n"
    end
    self
  end
end
