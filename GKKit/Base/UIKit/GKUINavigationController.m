//
//  GKUINavigationController.m
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKKitMacro.h"
#import "GKUINavigationController.h"

@interface GKUINavigationController ()

@end

@implementation GKUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navType=GKNavigationNormal;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)showNavigationBarColor:(UIColor *)color
{
    if (color) {
        UIImage *image = [UIImage imageWithColor:color];
        if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarPosition:barMetrics:)]) {
            [self.navigationBar setBackgroundImage:image forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        }
        else if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
            [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        }
    }
    else {
        if ([self.navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
            self.navigationBar.barTintColor = color;
        }
        else {
            self.navigationBar.tintColor = color;
        }
    }
    //self.navigationBar.bac
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
