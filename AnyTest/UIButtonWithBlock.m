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

- (void)dealloc
{
    [self freeBlocks];
    [_blockDict release];
    
    [super dealloc];
}

- (void)freeBlocks
{
    for (ButtonBlock block in [_blockDict allValues]) {
        Block_release(block);
    }
}

- (void)setBlock:(ButtonBlock)block forControlEvents:(UIControlEvents)event
{
    if (_blockDict == nil) {
        _blockDict = [[NSMutableDictionary alloc] init];
    }
    
    NSString *eventStr = [self stringFromControlEvent:event];
    
    if (_blockDict[eventStr]) {
        ButtonBlock tmp = _blockDict[eventStr];
        Block_release(tmp);
    }
    
    ButtonBlock _block = Block_copy(block);
    _blockDict[eventStr] = _block;
    
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
