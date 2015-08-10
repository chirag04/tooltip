#import "RCTTextManager+TextManager.h"
#import "RCTText+Text.h"
#import "RCTBridge.h"

@implementation RCTTextManager (TextManager)

//override to use initWithEventDispatcher
- (UIView *)view
{
    return [[RCTText alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

@end
