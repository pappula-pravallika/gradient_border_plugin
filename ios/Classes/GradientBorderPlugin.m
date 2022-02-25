#import "GradientBorderPlugin.h"
#if __has_include(<gradient_border/gradient_border-Swift.h>)
#import <gradient_border/gradient_border-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "gradient_border-Swift.h"
#endif

@implementation GradientBorderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGradientBorderPlugin registerWithRegistrar:registrar];
}
@end
