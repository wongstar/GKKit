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


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIButton *imageView=[[UIImageView alloc] initWithImage: [GKComponent gkGetImageByName:@"tab_btn_add"]];
    //imageView.frame=CGRectMake(100, 100, 30, 30);
    //[self.view addSubview:imageView];
    
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    [button setImage:[UIImage imageNamedWithGK:@"tab_btn_add"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(gotoAddView) forControlEvents:UIControlEventTouchUpInside];
    
    
//    UIImage *image=[UIImage imageNamedWithGK:@"tab_btn_add"];
//    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(200, 200, 30, 30)];
//    imageView.image=image;
//    
//    [self.view addSubview:imageView];
    
    [self.view addSubview:button];
    
    //NSArray *arr=[]
//    NSString *value=[GKComponent gkLocalizedStringForKey:@"name"];
//    NSLog(@"the value is%@",value);
        // Do any additional setup after loading the view, typically from a nib.
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
