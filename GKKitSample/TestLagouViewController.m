//
//  TestLagouViewController.m
//  GKKitSample
//
//  Created by igeak on 2017/8/3.
//  Copyright © 2017年 star. All rights reserved.
//

#import "TestLagouViewController.h"
#import "GKKit.h"
//#import "WRNavigationBar.h"
//#import "WRImageHelper.h"

#define NAVBAR_COLORCHANGE_POINT (-IMAGE_HEIGHT + NAV_HEIGHT)
#define NAV_HEIGHT 64
#define IMAGE_HEIGHT 200
#define SCROLL_DOWN_LIMIT 70
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)
@interface TestLagouViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) UIView *adView;
@end

@implementation TestLagouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //self.view.backgroundColor=[UIColor blueColor];
    self.tableView.contentInset=UIEdgeInsetsMake(IMAGE_HEIGHT-NAV_HEIGHT, 0, 0, 0);
    //self.tableView.scrollIndicatorInsets=UIEdgeInsetsMake(100, 0, 0, 0);
    [self.tableView addSubview:self.adView];
    [self.view addSubview:self.tableView];

    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    //[self setNavBarBgAlpha:@"0.0"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"the offsetY is %f",scrollView.contentOffset.y);
    CGFloat offsetY=scrollView.contentOffset.y;
    if(offsetY<-IMAGE_HEIGHT){
        [scrollView setContentOffset:CGPointMake(0, -IMAGE_HEIGHT)];
    }

}

-(UIView *)adView{
    if(_adView == nil ){
        _adView=[[UIView alloc] initWithFrame:CGRectMake(0, -IMAGE_HEIGHT, kScreenWidth, IMAGE_HEIGHT)];
        UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth-100)/2,60 , 100, 36)];
        [button setTitle:LSTR(@"Just do it") forState:UIControlStateNormal];
        [_adView addSubview:button];
        //_adView.frame=CGRectMake(0, -IMAGE_HEIGHT, kScreenWidth, IMAGE_HEIGHT);
        _adView.backgroundColor=[UIColor redColor];
    }
    return _adView;
}

-(UITableView *)tableView{
    if(_tableView == nil) {
        CGRect frame=CGRectMake(0, self.heightOffset, kScreenWidth,kScreenHeight-self.heightOffset);
        _tableView=[[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
    }
    return _tableView;
}


#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:nil];
    NSString *str = [NSString stringWithFormat:@"item %zd",indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}



@end
