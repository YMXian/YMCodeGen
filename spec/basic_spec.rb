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
spec.objc_interface "Wow", "NSProxy", ["NSCopying", "NSCoding"] do
  spec.objc_interface_bracket do
    spec.line "// something"
    spec.objc_interface_variable "_count", ["__weak", "NSArray<NSNumber*>*"]
  end
  spec.objc_property "something", "NSString*"
  spec.objc_property "something2", [:IBOutlet, "UIView*", "__nullable"]
  spec.objc_method   false, :void, 'do_it'
  spec.objc_method   false, :void, 'do_it', ["NSString*", "__nonnull"], :value
  spec.objc_method   false, :void, 'do_it', ["NSString*", "__nonnull"], :value, :somethin_else, ["NSString*", "__nullable"], :value2
end

puts spec.content
