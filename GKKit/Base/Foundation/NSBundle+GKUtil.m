//
//  NSBundle+GKBundle.m
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import "NSBundle+GKUtil.h"
#import "GKComponent.h"

@implementation NSBundle (GKUtil)

+(instancetype)fromGKBundle{
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[GKComponent class]] pathForResource:@"GKResource" ofType:@"bundle"]];
    }
    return bundle;
}


+(UIImage *)imageFromGKBundleByName:(NSString *)imageName{
    return [self imageFromGKBundleByName:imageName ofType:@"png"];
}


+(UIImage *)imageFromGKBundleByName:(NSString *)imageName ofType:(NSString *)type{
    UIImage *image = nil;
    if (image == nil) {
        NSBundle *gkBundle = [NSBundle fromGKBundle];
        NSString *path=[[gkBundle resourcePath] stringByAppendingString:[NSString stringWithFormat:@"/%@/%@",@"resource",imageName]];
        image = [UIImage imageWithContentsOfFile:path];

    }
    return image;
}




@end
