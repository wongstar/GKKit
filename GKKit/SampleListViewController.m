//
//  SampleListViewController.m
//  GKKitSample
//
//  Created by gk on 2017/7/24.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKKit.h"
#import "SampleListViewController.h"

@interface SampleListViewController (){
    NSArray *source;
    NSArray *vc;
}

@end

@implementation SampleListViewController

- (void)viewDidLoad {
    self.hasPullToRefresh=false;
    self.hasLoadMore=false;
    
    [self setupArr];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setupArr{
    source=@[@"Test MJ GIF tableView",@"Test Base UIViewController"];
    vc=@[@"TestGifTableViewController",@"TestBaseViewController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return source.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseIdentifier"];
    
    
    cell.textLabel.text=[source objectAtIndex:indexPath.row];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *nextVCString = [NSString stringWithFormat:@"%@", vc[indexPath.row]];
    UIViewController *nextVC =[NSClassFromString(nextVCString) new];
    nextVC.title = [NSString stringWithFormat:@"%@",source[indexPath.row]];
    nextVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:nextVC animated:YES];
}




@end
