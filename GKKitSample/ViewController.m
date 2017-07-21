//
//  ViewController.m
//  GKKitSample
//
//  Created by gk on 2017/7/13.
//  Copyright © 2017年 star. All rights reserved.
//

#import "ViewController.h"
#import "GKComponent.h"
#import "UIImage+GKUtil.h"
#import "TestBaseViewController.h"
#import "GKKit.h"
#import "TestTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    [button setImage:[UIImage imageNamedWithGK:@"tab_btn_add"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(gotoAddView) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"Test BaseViewContrller" forState:UIControlStateNormal];
    
    [button textLayoutImageBelow:20];

    
    [self.view addSubview:button];
    
    
    
    UIButton *button1=[[UIButton alloc] initWithFrame:CGRectMake(100, 200, 160, 30)];
    [button1 setImage:[UIImage imageNamedWithGK:@"tab_btn_add"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(gotoTableView) forControlEvents:UIControlEventTouchUpInside];
    
    [button1 setTitle:@"Test TableView" forState:UIControlStateNormal];
    
    [button1 textLayoutImageLeft:20];
    
    
    [self.view addSubview:button1];

    
    
    
}

-(void)gotoTableView{
    TestTableViewController *table=[[TestTableViewController alloc] init];
    [table hideToolBar];
    
    [self pushViewController:table];
}

-(void)gotoAddView{
    TestBaseViewController *add=[[TestBaseViewController alloc] init];
    [add hideToolBar];
    [self pushViewController:add];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
