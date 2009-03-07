#import "GrowlTransitionDurationPatch.h"
#import "MethodSwizzle.h"

@class GrowlNotificationDisplayBridge;

@implementation GrowlWebKitWindowController(GrowlTransitionDurationPatch)
- (id) initWithBridge_swizzled:(GrowlNotificationDisplayBridge *)displayBridge {
	id ret = [self initWithBridge_swizzled:displayBridge];
	[self setTransitionDuration:0.1];
	return ret;
}
@end

@implementation GrowlTransitionDurationPatch
+(void) load {
	if(MethodSwizzle(NSClassFromString(@"GrowlWebKitWindowController"), @selector(initWithBridge:), @selector(initWithBridge_swizzled:))) {
		NSLog(@"GrowlTransitionDuration installed");
	}
}
@end