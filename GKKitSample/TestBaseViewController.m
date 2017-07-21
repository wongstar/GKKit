//
//  TestBaseViewController.m
//  GKKitSample
//
//  Created by gk on 2017/7/20.
//  Copyright © 2017年 star. All rights reserved.
//

#import "TestBaseViewController.h"
#import "GKKitMacro.h"

@interface TestBaseViewController ()

@end

@implementation TestBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:LSTR(@"TestBaseView..")];
    [self setNavButtonWithTitle:@"Share" withIconImageName:nil withNavButtonType:NavRightButtonType withNavButtonClickBlock:^{
        
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
