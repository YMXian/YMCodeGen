$LOAD_PATH << File.expand_path("../../lib", __FILE__)

require 'kiss_shot'

spec_class = Class.new KissShot::Spec
spec = spec_class.new

spec.use KissShot::ObjC::All
spec.objc_import_d "Foundation/Foundation.h"
spec.objc_import_d "UIKit/UIKit.h"
spec.objc_protocol "What" do
  spec.line "// hello"
end
puts spec.content
