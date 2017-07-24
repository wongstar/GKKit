//
//  TestTableViewController.m
//  GKKitSample
//
//  Created by gk on 2017/7/20.
//  Copyright © 2017年 star. All rights reserved.
//

#import "TestGifTableViewController.h"
#import "GKKitMacro.h"

@interface TestGifTableViewController ()

@end

@implementation TestGifTableViewController

- (void)viewDidLoad {
//    self.hasPullToRefresh=false;
   // self.hasLoadMore=false;
    self.isGifHeader=true;
    [super viewDidLoad];
    self.title=@"Table";
    //self.tableView.backgroundColor=[UIColor grayColor];

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
    
    dispatch_after(dispatch_time_delay(2), dispatch_get_main_queue(), ^{
        [self headerEndFrefreshing];
    });
}
@end
