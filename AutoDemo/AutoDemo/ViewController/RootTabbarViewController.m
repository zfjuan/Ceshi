//
//  RootTabbarViewController.m
//  TrashCan
//
//  Created by fj zheng on 2019/6/18.
//  Copyright © 2019年 fj zheng. All rights reserved.
//

#import "RootTabbarViewController.h"
#import "VideoViewController.h"
#import "PersonViewController.h"

@interface RootTabbarViewController ()<UITabBarControllerDelegate>
@property (nonatomic, assign) NSInteger currentSelectIndex;
@property (nonatomic, assign) NSInteger lastSelectIndex;
@end

@implementation RootTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubViewControllers];
}

- (void)createSubViewControllers {
    VideoViewController *homeVc = [[VideoViewController alloc] init];
    homeVc.tabBarItem.title = @"video";
    homeVc.tabBarItem.image = [[UIImage imageNamed:@"shouye_II"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"shouye"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];


    PersonViewController *garVC = [[PersonViewController alloc] init];
    garVC.tabBarItem.title = @"视频";
    garVC.tabBarItem.image = [[UIImage imageNamed:@"lajifang_II"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    garVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"lajifang"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:homeVc];
    UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:garVC];

    //tabBar 底部工具栏背景颜色
    self.tabBar.barTintColor = UIColor.whiteColor;
    self.delegate = self;
    self.viewControllers       = @[navC2,navC1];
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger tabIndex = [tabBar.items indexOfObject:item];
    
    if (tabIndex != self.selectedIndex) {
        self.currentSelectIndex = tabIndex;
        self.lastSelectIndex = self.selectedIndex;
    }
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (self.currentSelectIndex != self.lastSelectIndex) {
        self.lastSelectIndex = self.currentSelectIndex;
//        UINavigationController *nav = self.viewControllers[self.currentSelectIndex];

    }
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}


@end
