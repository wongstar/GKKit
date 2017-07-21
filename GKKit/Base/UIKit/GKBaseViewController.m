//
//  GKBaseViewController.m
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKBaseViewController.h"
#import "GKKitMacro.h"

@interface GKBaseViewController (){
    UIButton *backButton;
}
@property(nonatomic,copy)   GKNavButtonClickBlock evNavLeftButtonClickBlock;
@property(nonatomic,copy)   GKNavButtonClickBlock evNavRightButtonClickBlock;

@end

@implementation GKBaseViewController


- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font = [UIFont systemFontOfSize:17];
        
        UIColor *color = self.titleColor;
        if (nil == color) {
            if ([self showFirstLevelNavigationBarBackgroudImage]) {
                color = [UIColor whiteColor];
            }
            else if (GKNaviBarStyleRed == [self naviBarStyle]) {
                color = [UIColor whiteColor];
            }
            else {
                color = kTextColorLevel1;
            }
        }
        titleView.textColor = color;
        
        self.navigationItem.titleView = titleView;
    }
    titleView.text = title;
    [titleView sizeToFit];
}


-(void)setNaviBackgroundColor:(UIColor *)navColor{
    _navBackgroundColor=navColor;
    self.navigationController.navigationBar.barTintColor=navColor;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor{
    _backgroundColor=backgroundColor;
    self.view.backgroundColor=_backgroundColor;
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    
    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    titleView.textColor = titleColor;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _heightOffset = 0.0;
        if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
            [self setEdgesForExtendedLayout:UIRectEdgeAll];
            _heightOffset = 64.0;
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(self.backgroundColor==nil){
        self.backgroundColor=[UIColor whiteColor];
    }
    self.view.backgroundColor = self.backgroundColor;//kTextColorLevel6;
    
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
    backButton.imageEdgeInsets=UIEdgeInsetsMake(0,-16, 0, 0);
    backButton.frame = CGRectMake(0, 0, 40 + image.size.width, 45);
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem = item;
}


-(void)setBackNormalImage:(NSString *)normal selectedImage:(NSString *)selected{
   
     [backButton setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
     [backButton setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
}

- (UIImage *)icon_back
{
    
    GKNaviBarStyle gkNaviBarStyle=[self naviBarStyle];
    if (GKNaviBarStyleRed == gkNaviBarStyle) {
        UIImage *image=[UIImage imageNamedWithGK:@"icon_back_white"];
        return image;
    }else if(GKNaviBarStyleDefault==gkNaviBarStyle){
        UIImage *image=[UIImage imageNamedWithGK:@"black_back_icon"];
        
         return image;
    }else if(GKNaviBarStyleOther==gkNaviBarStyle) {
        if(_backImage==nil){
            _backImage=[UIImage imageNamedWithGK:@"black_back_icon"];
        }
        return _backImage;
    }else{
        return [UIImage imageNamedWithGK:@"black_back_icon"];
    }
}

- (void)setNavigationBarHidden:(BOOL)hidden
{
    _navigationBarHidden = hidden;
    
    if (_navigationBarHidden) {
        _heightOffset = 0.0;
    }
    else
    {
        _heightOffset = 64.0;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:self.navigationBarHidden animated:animated];
    [[self.navigationController.navigationBar topItem] setHidesBackButton:YES];
    
    
    if ([self showFirstLevelNavigationBarBackgroudImage]) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    else if (GKNaviBarStyleRed == [self naviBarStyle]) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.navigationController setNavigationBarHidden:self.navigationBarHidden animated:animated];
    [[self.navigationController.navigationBar topItem] setHidesBackButton:YES];
    
}


-(void)hideToolBar{
    self.hidesBottomBarWhenPushed = YES;
}
-(void)showToolBar{
    self.hidesBottomBarWhenPushed = NO;
}



- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)home
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)pushViewController:(UIViewController *)vc{
    [self pushViewController:vc animated:YES];
}

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated{
    [self.navigationController pushViewController:vc animated:animated];
}

- (BOOL)showFirstLevelNavigationBarBackgroudImage
{
    return NO;
}

- (UIColor *)navigationBarTintColor
{
    return _navBackgroundColor;
}

- (GKNaviBarStyle)naviBarStyle
{
    return GKNaviBarStyleDefault;
}


/**
 set nav item left or right,if title is nil only image
 
 @param title title description
 @param iconImageName the image name
 @param buttonType buttonType left right or back
 @param navButtonClickBlock click event.
 */
- (void)setNavButtonWithTitle:(NSString *)title
            withIconImageName:(NSString *)iconImageName
            withNavButtonType:(NavButtonType)buttonType
            withNavButtonClickBlock:(GKNavButtonClickBlock)navButtonClickBlock
{
    if (title) {
        if (buttonType == NavBackButtonType || buttonType == NavLeftButtonType) {
            self.evNavLeftButtonClickBlock = navButtonClickBlock;
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(efNavleftButtonClick:)];
        }else{
            self.evNavRightButtonClickBlock = navButtonClickBlock;
            UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                               target:nil action:nil];
            negativeSpacer.width = 5;
            UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(efNavrightButtonClick:)];
            //rightBarBtn.image=[UIImage imageNamed:iconImageName];
            
            self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,rightBarBtn, nil];
        }
    }else{
        if (buttonType == NavBackButtonType || buttonType == NavLeftButtonType) {
            self.evNavLeftButtonClickBlock = navButtonClickBlock;
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:iconImageName] style:UIBarButtonItemStylePlain target:self action:@selector(efNavleftButtonClick:)];
        }else{
            self.evNavRightButtonClickBlock = navButtonClickBlock;
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:iconImageName] style:UIBarButtonItemStylePlain target:self action:@selector(efNavrightButtonClick:)];
        }
    }
}


-(void)setNavBackgroundImage:(UIImage *)image{
    [self.navigationController.navigationBar setBackgroundImage:image
                                              forBarMetrics:UIBarMetricsDefault];
}

-(void)efNavleftButtonClick:(id)sender
{
    if (self.evNavLeftButtonClickBlock) {
        self.evNavLeftButtonClickBlock();
    }else{
        
    }
}

-(void)efNavrightButtonClick:(id)sender
{
    if (self.evNavRightButtonClickBlock) {
        self.evNavRightButtonClickBlock();
    }else{
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
