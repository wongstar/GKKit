//
//  MJChiBaoZiHeader.h
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/12.
//  Copyright © 2015年 小码哥. All rights reserved.
// 

#import "MJRefreshGifHeader.h"

@interface DMShiningHeader : MJRefreshGifHeader

-(void)setIdelImage:(NSMutableArray *)idelImages setImageRefresh:(NSMutableArray *)refreshImages;

@property (nonatomic,strong) NSMutableArray *refreshImages;//刷新动画的图片数组
@property (nonatomic,strong) NSMutableArray *normalImages;//普通状态下的图片数组
@end
