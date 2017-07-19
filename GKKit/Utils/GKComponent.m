//
//  GKComponent.m
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKComponent.h"
#import "NSBundle+GKUtil.h"



@implementation GKComponent



+(UIImage *)gkGetImageByName:(NSString *)name{
   return  [NSBundle imageFromGKBundleByName:name];
}


+ (NSString *)gkLocalizedStringForKey:(NSString *)key{
    return [self localizedStringForKey:key withDefault:nil];
}

+ (NSString *)localizedStringForKey:(NSString *)key withDefault:(NSString *)defaultString
{
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        // 获得设备的语言
        NSString *language = [NSLocale preferredLanguages].firstObject;
        // 如果是iOS9以上，截取前面的语言标识
        if ([UIDevice currentDevice].systemVersion.floatValue >= 9.0) {
            NSRange range = [language rangeOfString:@"-" options:NSBackwardsSearch];
            language = [language substringToIndex:range.location];
        }
        
        if (language.length == 0) {
            language = @"zh-Hans";
        }
        
        // 先从MJRefresh.bundle中查找资源
        NSBundle *refreshBundle = [NSBundle fromGKBundle];
        if ([refreshBundle.localizations containsObject:language]) {
            bundle = [NSBundle bundleWithPath:[refreshBundle pathForResource:language ofType:@"lproj"]];
        }
    }
    defaultString = [bundle localizedStringForKey:key value:defaultString table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:defaultString table:nil];
}

@end
