//
//  GKMainTabViewController.m
//  GKKitSample
//
//  Created by igeak on 2017/7/19.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKMainTabViewController.h"
#import "ViewController.h"
#import "GKUINavigationController.h"

@interface GKMainTabViewController ()

@end

@implementation GKMainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ViewController *one=[[ViewController alloc] init];
    one.title=@"one";
    one.navigationBarHidden=YES;
    one.backgroundColor=[UIColor redColor];
    
    GKUINavigationController *oneNavi=[[GKUINavigationController alloc] initWithRootViewController:one];
    
    
    
    ViewController *two=[[ViewController alloc] init];
    two.title=@"two";
    two.navigationBarHidden=YES;
    two.backgroundColor=[UIColor blueColor];
    
    GKUINavigationController *twoNavi=[[GKUINavigationController alloc] initWithRootViewController:two];
    
    
    
    ViewController *three=[[ViewController alloc] init];
    three.title=@"three";
    three.navigationBarHidden=YES;
    three.backgroundColor=[UIColor grayColor];
    
    GKUINavigationController *threeNavi=[[GKUINavigationController alloc] initWithRootViewController:three];
    
    
    
    ViewController *four=[[ViewController alloc] init];
    four.title=@"four";
    four.navigationBarHidden=YES;
    four.backgroundColor=[UIColor redColor];
    
    GKUINavigationController *fourNavi=[[GKUINavigationController alloc] initWithRootViewController:four];
    
    
    
    ViewController *five=[[ViewController alloc] init];
    five.title=@"one";
    five.navigationBarHidden=YES;
    five.backgroundColor=[UIColor greenColor];
    
    GKUINavigationController *fiveNavi=[[GKUINavigationController alloc] initWithRootViewController:five];
    
    NSArray *vc=@[oneNavi,twoNavi,threeNavi,fourNavi,fiveNavi];
    
    [self initTabWithVC:vc];
    [self addCenterButtonWithBlock:^(id sender, id obj) {
        
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
