//
//  GKBaseCustomBarViewController.h
//  GKKitSample
//
//  Created by igeak on 2017/8/8.
//  Copyright © 2017年 star. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKBaseCustomBarViewController : UIViewController

@property (nonatomic, strong) UINavigationBar *navBar;
@property (nonatomic, strong) UINavigationItem *navItem;
@property (nonatomic,strong)UIImage *navigationBarBackgroundImage;
@property (nonatomic, assign) BOOL hideBackButton; // default is NO
-(void)setTitle:(NSString *)title;
@end
