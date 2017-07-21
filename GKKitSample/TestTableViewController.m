//
//  TestTableViewController.m
//  GKKitSample
//
//  Created by gk on 2017/7/20.
//  Copyright © 2017年 star. All rights reserved.
//

#import "TestTableViewController.h"
#import "GKKitMacro.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad {
//    self.hasPullToRefresh=false;
    self.hasLoadMore=false;
    [super viewDidLoad];
    self.title=@"Table";

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseIdentifier"];
    
    
    cell.textLabel.text=@"1";
    
    
    return cell;
}

-(void)loadMore{
    debugLog(@"LoadMore...");
}

-(void)pullToRefresh{
    debugLog(@"pull to referesh..");
}
@end
