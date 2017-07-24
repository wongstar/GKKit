//
//  AboutMeViewController.m
//  GKKitSample
//
//  Created by igeak on 2017/7/24.
//  Copyright © 2017年 star. All rights reserved.
//

#import "AboutMeViewController.h"
#import "GKKit.h"

@interface AboutMeViewController ()

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label=[UILabel new];
    label.textColor=[UIColor blackColor];
    label.frame=CGRectMake((kScreenWidth-300)/2, self.heightOffset+60, 300, 16);
    label.text=@"想了解更多，请关注我的个人公众号";
    label.font=SYSTEMFONT(13);
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
    UIImageView *iv=[[UIImageView alloc] init];
    iv.frame=CGRectMake((kScreenWidth-200)/2, label.bottom+10, 200, 200);
    iv.image=[UIImage imageNamed:@"about_us"];
    [self.view addSubview:iv];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
