//
//  GKSegmentViewController.h
//  GKKitSample
//
//  Created by igeak on 2017/7/31.
//  Copyright © 2017年 star. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKBaseViewController.h"
@class GKSegmentedControl;

typedef NS_ENUM(NSInteger,GKSegmentLocation) {
    GKSegmentTop,
    GKSegmentBottom
};

@interface GKSegmentViewController : GKBaseViewController

@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic,copy)  NSArray *titles;

@property (nonatomic,assign)GKSegmentLocation segmentLocation;
@property (nonatomic,strong)GKSegmentedControl *segementControl;

@property (nonatomic,assign)NSInteger segmentHeight;

- (void)prepare:(GKSegmentedControl *)segementControl;

- (void)prepare;

@end
