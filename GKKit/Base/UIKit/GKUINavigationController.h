//
//  GKUINavigationController.h
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,GKNavigationType){
    GKNavigationNormal,
    GKNavigationCenter
};

@interface GKUINavigationController : UINavigationController

@property (nonatomic,assign)GKNavigationType navType;
- (void)showNavigationBarColor:(UIColor *)color;

@end
