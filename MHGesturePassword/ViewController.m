//
//  ViewController.m
//  MHGesturePassword
//
//  Created by 哈哈 on 2018/9/25.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "ViewController.h"
#import "MHGesturePasswordView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    MHGesturePasswordView *view = [[MHGesturePasswordView alloc] initWithFrame:self.view.bounds block:nil];
   
    [self.view addSubview:view];

}


@end
