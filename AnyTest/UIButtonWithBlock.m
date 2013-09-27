//
//  UIButtonWithBlock.m
//  AnyTest
//
//  Created by apple on 13-9-25.
//  Copyright (c) 2013年 iKamobile. All rights reserved.
//

#import "UIButtonWithBlock.h"


@interface UIButtonWithBlock ()

@property (nonatomic, retain) NSMutableDictionary *blockDict;

@end

@implementation UIButtonWithBlock

- (void)setBlock:(ButtonBlock)block forControlEvents:(UIControlEvents)event
{
    if (_blockDict == nil) {
        _blockDict = [[NSMutableDictionary alloc] init];
    }
    
    NSString *eventStr = [self stringFromControlEvent:event];
    
    _blockDict[eventStr] = block;
    
    SEL handler = nil;
    switch (event) {
        case UIControlEventTouchUpInside:
            handler = @selector(touchUpInsideHandler);
            break;
            
        default:
            NSAssert(NO, @"to be support");
            break;
    }
    
    if (handler) {
        [self addTarget:self action:handler forControlEvents:event];
    } else {
        NSAssert(NO, @"handler is nil");
    }
}

- (void)touchUpInsideHandler
{
    NSString *eventStr = [self stringFromControlEvent:UIControlEventTouchUpInside];
    if (_blockDict[eventStr]) {
        ((ButtonBlock)_blockDict[eventStr])(self);
    }
}

- (NSString *)stringFromControlEvent:(UIControlEvents)event
{
    return [NSString stringWithFormat:@"%d", (int)event];
}

@end
