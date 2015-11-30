#encoding: utf-8

module KissShot::ObjC::Base

  # Create common <?,?,?> from array, nothing if array is empty
  # @param array [Array] things to create
  # @return [String] `<?,?,?>` if array not empty
  def _objc_diamond_array(array)
    unless array.empty?
      "<#{array.join(',')}>"
    else
      ""
    end
  end

end
