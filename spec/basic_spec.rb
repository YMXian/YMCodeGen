$LOAD_PATH << File.expand_path("../../lib", __FILE__)

require 'kiss_shot'

content = KissShot::Spec.run do
  use KissShot::ObjC::All

  objc_import_d "Foundation/Foundation.h"
  objc_import_d "UIKit/UIKit.h"
  objc_import_q "JSON/JSON.h"

  objc_block_comment do
    objc_method   false, :void, 'do_it', ["NSString*", "__nonnull"], :value, :somethin_else, ["NSString*", "__nullable"], :value2
    line "hahahahahah"
  end

  objc_protocol "What" do
    line "// hello"
  end

  objc_class "Wow"
  objc_interface "Wow", "NSProxy", ["NSCopying", "NSCoding"] do
    objc_interface_bracket do
      line "// something"
      objc_interface_variable "_count", ["__weak", "NSArray<NSNumber*>*"]
    end
    objc_property "something", "NSString*"
    objc_property "something", "NSString*", :copy
    objc_property "something2", [:IBOutlet, "UIView*", "__nullable"]
    objc_method   false, ['NSString*', :__nonnull], 'do_it'
    objc_method   false, :void, 'do_it', ["NSString*", "__nonnull"], :value
    objc_method   false, :void, 'do_it', ["NSString*", "__nonnull"], :value, :somethin_else, ["NSString*", "__nullable"], :value2
  end
  objc_implementation :Wow do
    objc_method   false, ['NSString*', :__nonnull], 'do_it' do
      line "return @\"1\";"
    end
  end
end

puts content
