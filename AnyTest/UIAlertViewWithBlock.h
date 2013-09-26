//
//  UIAlertViewWithBlock.h
//  AnyTest
//
//  Created by apple on 13-9-26.
//  Copyright (c) 2013年 iKamobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertViewWithBlock : UIAlertView

- (void)setBlock:(void (^)())block forButtonIndex:(NSInteger)index;

@end
