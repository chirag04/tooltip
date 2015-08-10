#import "UIView+React.h"
#import "RCTText+Text.h"
#import <objc/runtime.h>

static void * EventDispatcherKey = &EventDispatcherKey;

@implementation RCTText (Text)

// use AssociatedObject to add _eventDispatcher property on RCTText.
// need _eventDispatcher for initWithEventDispatcher below.

- (RCTEventDispatcher *)_eventDispatcher {
    return objc_getAssociatedObject(self, EventDispatcherKey);
}

- (void)set_eventDispatcher:(RCTEventDispatcher *)_eventDispatcher {
    objc_setAssociatedObject(self, EventDispatcherKey, _eventDispatcher, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (id)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    if ((self = [self initWithFrame:CGRectZero])) {
        self._eventDispatcher = eventDispatcher;
    }
    
    return self;
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (void)tappedMenuItem:(NSString *)text {
    [self._eventDispatcher sendTextEventWithType:RCTTextEventTypeChange
                                        reactTag:self.reactTag
                                            text:text
                                      eventCount:0];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    NSString *sel = NSStringFromSelector(action);
    NSRange match = [sel rangeOfString:@"magic_"];
    if (match.location == 0) {
        return YES;
    }
    return NO;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if ([super methodSignatureForSelector:sel]) {
        return [super methodSignatureForSelector:sel];
    }
    return [super methodSignatureForSelector:@selector(tappedMenuItem:)];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    NSString *sel = NSStringFromSelector([invocation selector]);
    NSRange match = [sel rangeOfString:@"magic_"];
    if (match.location == 0) {
        [self tappedMenuItem:[sel substringFromIndex:6]];
    } else {
        [super forwardInvocation:invocation];
    }
}


@end
