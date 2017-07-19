//
//  GKComponent.h
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GKComponent : NSObject


+ (NSString *)gkLocalizedStringForKey:(NSString *)key;
+(UIImage *)gkGetImageByName:(NSString *)name;

@end
