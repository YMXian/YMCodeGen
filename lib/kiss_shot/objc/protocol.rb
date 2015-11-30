#encoding: utf-8

module KissShot::ObjC::Protocol

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
  end
end
