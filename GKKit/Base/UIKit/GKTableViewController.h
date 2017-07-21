//
//  GKTableViewController.h
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKBaseViewController.h"

@interface GKTableViewController : GKBaseViewController

@property   (nonatomic, retain, readonly) UITableView *tableView;
@property   (nonatomic, assign) UITableViewStyle viewStyle;

@property   (nonatomic, assign) BOOL    hasPullToRefresh;  // 是否带有下拉刷新，默认YES
@property   (nonatomic, assign) BOOL    hasLoadMore;       // 是否带有加载更多，默认YES
@property   (nonatomic) CGFloat     bottomOffset;
@property   (nonatomic,assign) BOOL isGifHeader;
@property (nonatomic,strong) NSMutableArray *refreshImages;//刷新动画的图片数组
@property (nonatomic,strong) NSMutableArray *normalImages;//普通状态下的图片数组


@property (nonatomic,assign)NSInteger currentPage;

- (id)initWithStyle:(UITableViewStyle)style;


/**
  reload tableview...
 */
- (void)reloadData;


//override
- (BOOL)isLoadMoreViewNeeded;

/**
 pull to refresh more
 */
- (void)pullToRefresh;

//load more will call back..
- (void)loadMore;


/**
 end refresh...
 */
-(void)endRefresh;
@end
