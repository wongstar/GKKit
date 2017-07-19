//
//  UIColor+GKUtil.h
//  GKKitSample
//
//  Created by gk on 2017/7/17.
//  Copyright © 2017年 star. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GKUtil)

+(UIColor *)colorwithRGB:(float)rgb;

/**
 * 用一个24位的整数生成UIColor
 *
 * @param rgb 形如0xRRGGBB
 */
+ (UIColor *)colorWithRGB:(int)rgb;

/**
 * 用一个hex string生成UIColor，比如#ffffff
 *
 * @param hexString 形如#ffffff
 */
+ (UIColor *)colorWithHexCode:(NSString *)hexString;

@end
