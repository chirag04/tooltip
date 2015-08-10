#import "RCTTextManager+TextManager.h"
#import "RCTText+Text.h"
#import "RCTBridge.h"

@implementation RCTTextManager (TextManager)

- (UIView *)view
{
    return [[RCTText alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

@end
