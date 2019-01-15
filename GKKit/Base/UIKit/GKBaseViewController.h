//
//  GKBaseViewController.h
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKKitMacro.h"

typedef enum : NSUInteger {
    GKNaviBarStyleDefault,  // 白底黑字，红色返回按钮
    GKNaviBarStyleRed,      // 红底白字，白色返回按钮
    GKNaviBarStyleOther,//其他自己定义的
    
} GKNaviBarStyle;


typedef enum  {
    NavBackButtonType = 0,//返回按钮
    NavLeftButtonType,
    NavRightButtonType,
} NavButtonType;

typedef void (^GKNavButtonClickBlock)();

@protocol GKBaseViewControllerProtocolExtend <NSObject>

@optional
- (BOOL)showFirstLevelNavigationBarBackgroudImage;
- (UIColor *)navigationBarTintColor;
@end


@interface GKBaseViewController : UIViewController<GKBaseViewControllerProtocolExtend>

@property (nonatomic, assign) BOOL navigationBarHidden;

@property (nonatomic, assign) CGFloat heightOffset;

@property (nonatomic, strong) UIColor *titleColor; // default is kTextColorLevel1

@property (nonatomic, assign) BOOL hideBackButton; // default is NO.

@property (nonatomic,strong)UIColor *backgroundColor;//view background color

@property (nonatomic,strong)UIColor *navBackgroundColor;//nav bar background color

@property (nonatomic,strong)UIImage *backImage;
@property (nonatomic,assign)GKNaviBarStyle barStyle;



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
      withNavButtonClickBlock:(GKNavButtonClickBlock)navButtonClickBlock;

- (void)back;
- (void)home;
- (void)dismiss;

-(void)hideToolBar;

-(void)showToolBar;

-(void)pushViewController:(UIViewController *)vc;

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated;


-(void)setBackNormalImage:(NSString *)normal selectedImage:(NSString *)selected;


- (void)setNavBarTintColor:(UIColor *)titleColor;

-(void)setNaviBackgroundColor:(UIColor *)navColor;

- (GKNaviBarStyle)naviBarStyle;
@end



