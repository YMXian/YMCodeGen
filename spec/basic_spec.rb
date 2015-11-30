$LOAD_PATH << File.expand_path("../../lib", __FILE__)

require 'kiss_shot'

spec_class = Class.new KissShot::Spec
spec = spec_class.new

spec.use(KissShot::ObjC::All)
.objc_import_d("Foundation/Foundation.h")
.objc_import_d("UIKit/UIKit.h")
.objc_protocol("What") {
  spec.line "// hello"
}

spec.objc_class "Wow"
spec.objc_interface "Wow", "NSProxy", ["NSCopying", "NSCoding"]

puts spec.content
