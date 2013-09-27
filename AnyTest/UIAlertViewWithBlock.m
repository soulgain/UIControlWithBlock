//
//  UIAlertViewWithBlock.m
//  AnyTest
//
//  Created by apple on 13-9-26.
//  Copyright (c) 2013年 iKamobile. All rights reserved.
//

#import "UIAlertViewWithBlock.h"

@interface UIAlertViewWithBlock () <UIAlertViewDelegate>

@property (nonatomic, retain) NSMutableDictionary *blockDict;

@end

@implementation UIAlertViewWithBlock

- (void)setBlock:(void (^)())block forButtonIndex:(NSInteger)index
{
    self.delegate = self;
    if (_blockDict == nil) {
        _blockDict = [[NSMutableDictionary alloc] init];
    }
    
    NSString *indexString = [self stringFromButtonIndex:index];
    _blockDict[indexString] = block;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *indexString = [self stringFromButtonIndex:buttonIndex];
    if (_blockDict[indexString]) {
        void (^tmp)() = _blockDict[indexString];
        tmp();
    }
}

- (NSString *)stringFromButtonIndex:(NSInteger)index
{
    return [NSString stringWithFormat:@"%d", index];
}

@end
