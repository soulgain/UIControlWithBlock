//
//  UIView+Frame.m
//  AnyTest
//
//  Created by apple on 13-9-25.
//  Copyright (c) 2013年 iKamobile. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setFrameX:(GLfloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setFrameY:(GLfloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setFrameWidth:(GLfloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setFrameHeight:(GLfloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)printFrame
{
    CGRect frame = self.frame;
    NSLog(@"%@: {(%.1f, %.1f), (%.1f, %.1f)}", [self class], frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

@end
