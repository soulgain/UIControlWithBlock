//
//  ViewController.m
//  AnyTest
//
//  Created by apple on 13-9-25.
//  Copyright (c) 2013年 iKamobile. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"
#import "UIButtonWithBlock.h"
#import "UIAlertViewWithBlock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    
    [self.view printFrame];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButtonWithBlock *button = [UIButtonWithBlock buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 200, 120, 44);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"up" forState:UIControlStateNormal];
    [button setTitle:@"down" forState:UIControlStateHighlighted];
    [button setBlock:^(id sender) {
        [self testAlert];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)testAlert
{
    NSString *test = @"cancel button";
    UIAlertViewWithBlock *alert = [[[UIAlertViewWithBlock alloc] initWithTitle:@"title" message:@"msg" delegate:nil cancelButtonTitle:@"111" otherButtonTitles:@"222", nil] autorelease];
    alert.delegate = alert;
    [alert setBlock:^{
        NSLog(@"%@", test);
    } forButtonIndex:0];
    [alert setBlock:^{
        NSLog(@"ok button");
    } forButtonIndex:1];
    [alert show];
}

@end
