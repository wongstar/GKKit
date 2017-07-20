//
//  GKTabBarController.h
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//
#import "GKKitMacro.h"
#import <UIKit/UIKit.h>

@interface GKTabBarController : UITabBarController
//@property(nonatomic,strong)UIButton *centerButton;
@property(nonatomic,strong)GKActionWithBlock centerButtonBlock;


@property (nonatomic,strong)NSArray *tabNormalImages;
@property (nonatomic,strong)NSArray *tabSelectedImages;
@property (nonatomic,strong)NSArray *tabTexts;
@property (nonatomic,assign)NSInteger selectIndex;

@property (nonatomic,strong)NSMutableDictionary *textAttrs;

@property(nonatomic,strong)NSMutableDictionary *selectTextAttrs;

-(void)initTabWithVC:(NSArray *)vc;

-(void)initTabWithVC:(NSArray *)vc withTabNormalImages:(NSArray *)normalImages withTabSelectedImage:(NSArray *)selectedImages withText:(NSArray *)texts;


-(void)buttonInToolBarWithImage:(NSString *)imageName withIndex:(NSInteger)index withBlock:(GKActionWithBlock)block;

-(void)addCenterButtonWithNormalImage:(NSString *)normlName  withSeletedImageName:(NSString *)selectedImageName witchBlock:(GKActionWithBlock)block;

-(void)addCenterButtonWithBlock:(GKActionWithBlock)block;

@end
