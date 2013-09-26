//
//  UIView+Frame.h
//  AnyTest
//
//  Created by apple on 13-9-25.
//  Copyright (c) 2013年 iKamobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

- (void)setFrameX:(GLfloat)x;
- (void)setFrameY:(GLfloat)y;
- (void)setFrameWidth:(GLfloat)width;
- (void)setFrameHeight:(GLfloat)height;
- (void)printFrame;

@end
