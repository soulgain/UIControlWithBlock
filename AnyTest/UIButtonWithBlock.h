//
//  UIButtonWithBlock.h
//  AnyTest
//
//  Created by apple on 13-9-25.
//  Copyright (c) 2013年 iKamobile. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock)(id sender);

@interface UIButtonWithBlock : UIButton

- (void)setBlock:(ButtonBlock)block forControlEvents:(UIControlEvents)event;

@end
