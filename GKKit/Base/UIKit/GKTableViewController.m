//
//  GKTableViewController.m
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKTableViewController.h"
#import "MJRefresh.h"
#import "GKKitMacro.h"
#import "DMShiningHeader.h"
#import "DMIconAutoFooter.h"

@interface GKTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property   (nonatomic, retain, readwrite) UITableView  *baseTableView;
@end

@implementation GKTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.viewStyle = style;
        _hasPullToRefresh = YES;
        _hasLoadMore = YES;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _hasPullToRefresh = YES;
        _hasLoadMore = YES;
        self.viewStyle = UITableViewStylePlain;
    }
    return self;
}

- (void)dealloc
{
    self.baseTableView.delegate = nil;
    self.baseTableView.dataSource = nil;
    self.baseTableView = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:self.viewStyle];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.contentInset = UIEdgeInsetsMake(self.heightOffset, 0, self.bottomOffset, 0);
    
    if (0 < [self.navigationController.viewControllers indexOfObject:self]) {
        tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 20)];
    }
    else {
        tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 64)];
    }
    
    [self.view addSubview:tableview];
    self.baseTableView = tableview;
    
    __weak GKTableViewController    *weakSelf = self;
    
    if (_hasPullToRefresh) {
        if (_isGifHeader){
            [weakSelf addHeader];
        }else{
            self.baseTableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
                [weakSelf pullToRefresh];
            }];
        }
    }
    
    if (_hasLoadMore) {
        if(_isGifHeader){
            [weakSelf addFooter];
        }else{
            self.baseTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                [weakSelf loadMore];
            }];
        }
    }
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.baseTableView deselectRowAtIndexPath:[self.baseTableView indexPathForSelectedRow] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UITableView *)tableView
{
    return self.baseTableView;
}

- (void)reloadData
{
    [self.tableView reloadData];
}


/**
 *
 *  普通状态下的图片
 */
- (NSMutableArray *)normalImages
{
    return _normalImages;
}

//正在刷新状态下的图片
- (NSMutableArray *)refreshImages
{
       return _refreshImages;
}

- (void)addHeader
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    
    DMShiningHeader *header = [DMShiningHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullToRefresh)];
    
    [header setIdelImage:self.normalImages setImageRefresh:self.refreshImages];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    // 马上进入刷新状态
    [header beginRefreshing];
    
    
    // 设置header
    self.tableView.mj_header = header;
}

-(void)addFooter
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.tableView.mj_footer = [DMIconAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}


#pragma mark - Virtual Methods

- (BOOL)isLoadMoreViewNeeded
{
    return NO;
}

- (void)pullToRefresh
{
    // 子类override
}

- (void)loadMore
{
    // 子类override
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


@end
