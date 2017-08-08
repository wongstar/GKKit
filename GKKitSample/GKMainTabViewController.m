//
//  GKMainTabViewController.m
//  GKKitSample
//
//  Created by igeak on 2017/7/19.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKMainTabViewController.h"
#import "ViewController.h"
#import "GKKit.h"
#import "GKUINavigationController.h"
#import "SampleListViewController.h"
#import "AboutMeViewController.h"
#import "GKCover.h"

@interface GKMainTabViewController ()

@end

@implementation GKMainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    SampleListViewController *one=[[SampleListViewController alloc] init];
    one.title=@"Sample List";
    one.navigationBarHidden=NO;
    //one.backgroundColor=[UIColor grayColor];
    
    GKUINavigationController *oneNavi=[[GKUINavigationController alloc] initWithRootViewController:one];
    //[one setTitleColor:[UIColor whiteColor]];
    [oneNavi showNavigationBarColor:gkColorFromRGBA(244, 89, 27,1)];
    
    ViewController *two=[[ViewController alloc] init];
//    two.title=@"two";
//    two.navigationBarHidden=YES;
    two.backgroundColor=[UIColor grayColor];
    
    GKUINavigationController *twoNavi=[[GKUINavigationController alloc] initWithRootViewController:two];
    
    
    
    ViewController *three=[[ViewController alloc] init];
    three.title=@"three";
    three.navigationBarHidden=YES;
    three.backgroundColor=[UIColor whiteColor];
    
    GKUINavigationController *threeNavi=[[GKUINavigationController alloc] initWithRootViewController:three];
    
    threeNavi.navType=GKNavigationCenter;
    
    ViewController *four=[[ViewController alloc] init];
    four.title=@"four";
    four.navigationBarHidden=YES;
    four.backgroundColor=[UIColor redColor];
    
    GKUINavigationController *fourNavi=[[GKUINavigationController alloc] initWithRootViewController:four];
    
    
    
    AboutMeViewController *five=[[AboutMeViewController alloc] init];
    five.title=@"关于我";
    
    [five setTitleColor:[UIColor whiteColor]];
   
    GKUINavigationController *fiveNavi=[[GKUINavigationController alloc] initWithRootViewController:five];
    
    [fiveNavi showNavigationBarColor:gkColorFromRGBA(244, 89, 27,1)];
    NSArray *vc=@[oneNavi,twoNavi,threeNavi,fourNavi,fiveNavi];
    
    self.tabNormalImages=@[@"one",@"two",@"",@"three",@"four"];
    self.tabSelectedImages=@[@"one_selected",@"two_selected",@"",@"three_selected",@"four_selected"];
    self.tabTexts=@[LSTR(@"tab_one_title"),LSTR(@"tab_two_title"),LSTR(@""),LSTR(@"tab_three_title"),LSTR(@"tab_four_title")];
    
    [self initTabWithVC:vc];
    
    
    //__weak t=WeakSelf(self);
    
    __weak typeof(self)weakSelf=self;
    
    
   
    [self addCenterButtonWithBlock:^(id sender, id obj) {
        debugLog(@".... click...");
        
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
       
        UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(20, 18, 100, 36)];
        
        [button setTitle:@"Button" forState:UIControlStateNormal];
        [view addSubview:button];
        
       
        
        [GKCover coverFrom:weakSelf.view contentView:view style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleTop animStyle:GKCoverAnimStyleCenter notClick:NO showBlock:^{
            
        } hideBlock:^{
            
        }];
    }];
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
