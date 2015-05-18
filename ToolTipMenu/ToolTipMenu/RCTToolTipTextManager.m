//
//  RCTToolTipTextManager.m
//  ToolTipMenu
//
//  Created by Chirag Jain on 5/15/15.
//  Copyright (c) 2015 Chirag Jain. All rights reserved.
//

#import "RCTToolTipTextManager.h"
#import "RCTToolTipText.h"
#import "RCTBridge.h"

@implementation RCTToolTipTextManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [[RCTToolTipText alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

@end
