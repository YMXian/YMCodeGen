#encoding: utf-8

module KissShot::ObjC::Import
  include KissShot::ObjC::Base

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
    self
  end
end
