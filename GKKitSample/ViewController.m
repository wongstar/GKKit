//
//  ViewController.m
//  GKKitSample
//
//  Created by igeak on 2017/7/13.
//  Copyright © 2017年 star. All rights reserved.
//

#import "ViewController.h"
#import "GKComponent.h"
#import "UIImage+GKUtil.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView=[[UIImageView alloc] initWithImage: [GKComponent gkGetImageByName:@"tab_btn_add"]];
    imageView.frame=CGRectMake(100, 100, 30, 30);
    [self.view addSubview:imageView];
    
   
    //NSArray *arr=[]
//    NSString *value=[GKComponent gkLocalizedStringForKey:@"name"];
//    NSLog(@"the value is%@",value);
        // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
