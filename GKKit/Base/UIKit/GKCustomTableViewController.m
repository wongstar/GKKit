//
//  GKCustomTableViewController.m
//  GKKitSample
//
//  Created by gk on 2017/8/8.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKCustomTableViewController.h"


@interface GKCustomTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property   (nonatomic, retain, readwrite) UITableView  *baseTableView;

@end

@implementation GKCustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if(self.contentInset.bottom == UIEdgeInsetsZero.bottom&&self.contentInset.top==UIEdgeInsetsZero.top&&self.contentInset.left==UIEdgeInsetsZero.left&&self.contentInset.right==UIEdgeInsetsZero.right){
        return;
    }
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.contentInset = self.contentInset;
   
    [self.view addSubview:tableview];
    self.baseTableView = tableview;
    
    [self wr_setNavBarBackgroundAlpha:0];
}


- (UITableView *)tableView
{
    return self.baseTableView;
}

- (void)reloadData
{
    [self.baseTableView reloadData];
}


-(void)setContentInset:(UIEdgeInsets)contentInset{
    self.contentInset=contentInset;
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

- (void)dealloc
{
    self.baseTableView.delegate = nil;
    self.baseTableView.dataSource = nil;
    self.baseTableView = nil;
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
