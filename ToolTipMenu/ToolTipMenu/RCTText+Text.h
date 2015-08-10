#import <UIKit/UIKit.h>
#import "RCTEventDispatcher.h"
#import "RCTText.h"

@class RCTEventDispatcher;

@interface RCTText (Text)

@property (nonatomic, strong) RCTEventDispatcher *_eventDispatcher;

- (void)tappedMenuItem:(NSString *)text;

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher;

@end
