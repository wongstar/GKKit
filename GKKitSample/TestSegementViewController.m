//
//  TestSegementViewController.m
//  GKKitSample
//
//  Created by igeak on 2017/7/31.
//  Copyright © 2017年 star. All rights reserved.
//

#import "TestSegementViewController.h"
#import "TestBaseViewController.h"
#import "GKSegmentedControl.h"

@interface TestSegementViewController ()

@end

@implementation TestSegementViewController

- (void)viewDidLoad {
    //self.titles=@"Segment Test";
    //self.navigationBarHidden=YES;
    
    [super viewDidLoad];
    
  
    
    
    TestBaseViewController *one=[[TestBaseViewController alloc] init];
    one.navigationBarHidden=YES;
    one.backgroundColor=[UIColor greenColor];
    
    TestBaseViewController *two=[[TestBaseViewController alloc] init];
    two.navigationBarHidden=YES;
    two.backgroundColor=[UIColor blueColor];
    
    TestBaseViewController *three=[[TestBaseViewController alloc] init];
    three.navigationBarHidden=YES;
    three.backgroundColor=[UIColor redColor];
    
    
    self.viewControllers=@[one,two,three];
    self.titles=@[@"0",@"1",@"3"];
    self.segmentLocation=GKSegmentBottom;
    
    [self prepare];
    
    
    // Do any additional setup after loading the view.
}

-(void)prepare{
    [super prepare:nil];
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
