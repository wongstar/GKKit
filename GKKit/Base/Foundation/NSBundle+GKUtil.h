//
//  NSBundle+GKBundle.h
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSBundle (GKUtil)


+(instancetype)fromGKBundle;
+(UIImage *)imageFromGKBundleByName:(NSString *)imageName;
+(UIImage *)imageFromGKBundleByName:(NSString *)imageName ofType:(NSString *)type;


@end
