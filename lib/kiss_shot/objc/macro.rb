#encoding: utf-8

module KissShot::ObjC::Macro
  include KissShot::ObjC::Base

  # Add // comment
  # @param input [String] comment
  # @return self
  def objc_comment(input)
    line "//  #{input}"
  end

  # Add /**/ comment
  # @return self
  def objc_block_comment
    line "/*"
    push_line_prefix " *  "
    yield if block_given?
    pop_line_prefix  " *  "
    line " */"
  end

  # For `#import <???>`, d is for diamond
  # @param input [String] things in `#import <???>`
  # @return self
  def objc_import_d(input)
    objc_import "<#{input}>"
  end

  # For `#import "???"`, q is for quotes
  # @param input [String] header to import
  # @return self
  def objc_import_q(input)
    objc_import "\"#{input}\""
  end

  # For `#import ???`
  # @param input [String] header to import
  # @return self
  def objc_import(input)
    line "#import #{input}"
  end
end
