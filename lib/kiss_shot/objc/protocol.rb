#encoding: utf-8

module KissShot::ObjC::Protocol

  # Add line for @required
  # @return self
  def objc_protocol_required
    line
    line "@required"
    self
  end

  # Add line for @optional
  # @return self
  def objc_protocol_optional
    line
    line "@optional"
    self
  end

  # For @protocol
  # @param name [String] protocol name
  # @param supers [Array] array of super protocols, default to ['NSObject']
  # @return self
  def objc_protocol(name, supers = ["NSObject"])
    # Add new line
    line
    # Declare
    raw "@protocol #{name}"
    if block_given?
      # If block given, add supers, and yield
      if supers.count
        raw " <#{supers.join(', ')}>"
      end
      # new line, no indent
      line
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
