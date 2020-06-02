//
//  LTVFPersonViewController.m
//  VideoConferenceLTVFSDK
//
//  Created by fj zheng on 2019/7/26.
//  Copyright © 2019 fj zheng. All rights reserved.
//

#import "PersonViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 100,100)];
    [btn2 setTitle:@"next" forState:UIControlStateNormal];
    NSString *str =  KColorValue;
    btn2.backgroundColor = [UIColor colorWithHexStr:str];
    [self.view addSubview:btn2];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

@end
