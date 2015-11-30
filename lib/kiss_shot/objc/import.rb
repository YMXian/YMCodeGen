#encoding: utf-8

module KissShot::ObjC::Import

  # For #import <ARG0>
  # d is for diamond
  def objc_import_d(input)
    objc_import "<#{input}>"
  end

  # For #import "ARG0"
  # q is for quotes
  def objc_import_q(input)
    objc_import "\"#{input}\""
  end

  # For #import ARG0
  def objc_import(input)
    line "#import #{input}"
  end
end
