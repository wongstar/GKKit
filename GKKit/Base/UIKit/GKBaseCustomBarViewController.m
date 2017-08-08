//
//  GKBaseCustomBarViewController.m
//  GKKitSample
//
//  Created by igeak on 2017/8/8.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKBaseCustomBarViewController.h"
#import "GKKit.h"


@interface GKBaseCustomBarViewController (){
    UIButton *backButton;
}

@end

@implementation GKBaseCustomBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTitle:(NSString *)title{
    self.navItem.title=title;
}


- (void)setupNavBar
{
    
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;

    // 自定义导航栏必须设置这个属性!!!!!!!
    [self wr_setCustomNavBar:self.navBar];
    
    [self.view addSubview:self.navBar];
    self.navBar.items = @[self.navItem];
    
    // 设置自定义导航栏背景图片
    [self wr_setNavBarBackgroundImage:self.navigationBarBackgroundImage];
    
    // 设置自定义导航栏默认背景颜色
    // [self wr_setNavBarBarTintColor:MainNavBarColor];
    
    // 设置自定义导航栏标题颜色
    [self wr_setNavBarTitleColor:[UIColor whiteColor]];
    
    // 设置自定义导航栏左右按钮字体颜色
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
    
    if (0 < [self.navigationController.viewControllers indexOfObject:self]) {
        if (NO == self.hideBackButton) {
            [self addBackButton];
        }
    }
}


- (void)setHideBackButton:(BOOL)hide
{
    _hideBackButton = hide;
    
    if ([self isViewLoaded]) {
        self.navigationItem.leftBarButtonItem = nil;
        if (!hide) {
            [self addBackButton];
        }
    }
}

- (void)addBackButton
{
    UIImage *image = [self icon_back];
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundColor:[UIColor clearColor]];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    backButton.imageEdgeInsets=UIEdgeInsetsMake(0,-46, 0, 0);
    backButton.frame = CGRectMake(0, 0, 40 + image.size.width, 45);
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navItem.leftBarButtonItem = item;
}


-(void)setBackNormalImage:(NSString *)normal selectedImage:(NSString *)selected{
    
    [backButton setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
}

- (UIImage *)icon_back
{
    return [UIImage imageNamedWithGK:@"icon_back_white"];
}

-(UIImage *)navigationBarBackgroundImage{
    if(_navigationBarBackgroundImage == nil ){
        
        _navigationBarBackgroundImage=[UIImage imageNamedWithGK:@"nav_item_bg"];
        
    }
    return _navigationBarBackgroundImage;
}


- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}





- (UINavigationBar *)navBar
{
    if (_navBar == nil) {
        _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth , 64)];
    }
    return _navBar;
}

- (UINavigationItem *)navItem
{
    if (_navItem == nil) {
        _navItem = [UINavigationItem new];
    }
    return _navItem;
}


@end
