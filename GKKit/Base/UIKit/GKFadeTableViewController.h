//
//  GKCustomTableViewController.h
//  GKKitSample
//
//  Created by gk on 2017/8/8.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKBaseViewController.h"

@interface GKFadeTableViewController : GKBaseViewController
@property   (nonatomic, retain, readonly) UITableView *tableView;
@property   (nonatomic,assign) UIEdgeInsets contentInset;

@property (nonatomic,assign)BOOL isCustomContentInset;

@property   (nonatomic) CGFloat     bottomOffset;

@end
