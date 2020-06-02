//
//  VideoViewController.m
//  VideoConferenceLTVFSDK
//
//  Created by fj zheng on 2019/7/19.
//  Copyright © 2019 fj zheng. All rights reserved.
//

#import "VideoViewController.h"
#import "RootTabbarViewController.h"
@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 100,100)];
    [btn2 setTitle:@"next" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnClick2) forControlEvents:UIControlEventTouchUpInside];
    btn2.backgroundColor = [UIColor brownColor];
    [self.view addSubview:btn2];
//

}

- (void)btnClick2 {
   

}


@end
