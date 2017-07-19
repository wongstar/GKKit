//
//  GKUIFactory.h
//  GKKitSample
//
//  Created by igeak on 2017/7/14.
//  Copyright © 2017年 star. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GKUIFactory : NSObject

+ (UILabel *)zeroLable;
+ (UILabel *)zeroLableWithFontSize:(CGFloat)size;
+ (UILabel *)labelWithFrame:(CGRect)frame fontSize:(CGFloat)size;
+ (UILabel *)clearLabelWithFrame:(CGRect) frame andFontSize:(CGFloat)size;
+ (UILabel *)clearLabelWithFrame:(CGRect) frame FontSize:(CGFloat)size Color:(UIColor *)color;
+ (UILabel *)clearLabelWithFrame:(CGRect) frame BoldFontSize:(CGFloat)size Color:(UIColor *)color;

+ (UIView *)zeroView;
+ (UIView *)viewWithFrame:(CGRect)frame;
+ (UIView *)viewWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor;

+ (UIImageView *)zeroImageView;
+ (UIImageView *)zeroImageViewWithFrame:(CGRect)frame;

+ (UIButton *)zeroButton;

@end
