//
//  MJChiBaoZiHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/12.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "DMShiningHeader.h"
#import "NSBundle+GKUtil.h"

@implementation DMShiningHeader

-(void)setIdelImage:(NSMutableArray *)idelImages setImageRefresh:(NSMutableArray *)refreshImages{
    self.normalImages=idelImages;
    self.refreshImages=refreshImages;
}

/**
 *
 *  普通状态下的图片
 */
- (NSMutableArray *)normalImages
{
    if (_normalImages == nil) {
        _normalImages = [[NSMutableArray alloc] init];
        for (NSUInteger i = 1; i<=6; i++) {
            
            UIImage *image = [NSBundle imageFromGKBundleByName:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
            [_normalImages addObject:image];
        }
       
    }
    return _normalImages;
}

//正在刷新状态下的图片
- (NSMutableArray *)refreshImages
{
    if (_refreshImages == nil) {
        _refreshImages = [[NSMutableArray alloc] init];
        
        //循环添加图片
        for (NSUInteger i = 1; i<=7; i++) {
            UIImage *image = [NSBundle imageFromGKBundleByName:[NSString stringWithFormat:@"dropdown_loading_000%zd", i]];
            [self.refreshImages addObject:image];
        }
    }
    return _refreshImages;
}


#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    // 设置普通状态的动画图片
 
    [self setImages:self.normalImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）

    [self setImages:self.refreshImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:self.refreshImages forState:MJRefreshStateRefreshing];
}
@end
