#import <UIKit/UIKit.h>
#import "RCTEventDispatcher.h"
#import "RCTText.h"

@class RCTEventDispatcher;

@interface RCTText (Text)

// is it ok to have it as a property instead of ivar?
// doesn't work without having this as property.
@property (nonatomic, strong) RCTEventDispatcher *_eventDispatcher;

- (void)tappedMenuItem:(NSString *)text;

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher;

@end
