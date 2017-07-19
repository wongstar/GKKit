//
//  GKUIFactory.m
//  GKKitSample
//
//  Created by igeak on 2017/7/14.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKUIFactory.h"
#import "GKKitMacro.h"

@implementation GKUIFactory

+ (UILabel *)zeroLable
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    return label;
}

+ (UILabel *)zeroLableWithFontSize:(CGFloat)size
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:size];
    return label;
}

+ (UILabel *)labelWithFrame:(CGRect)frame fontSize:(CGFloat)size{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:size];
    return label;
}

+ (UILabel *)clearLabelWithFrame:(CGRect) frame andFontSize:(CGFloat)size{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:size];
    return label;
}

+ (UILabel *)clearLabelWithFrame:(CGRect) frame FontSize:(CGFloat)size Color:(UIColor *)color{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = color;
    return label;
}

+ (UILabel *)clearLabelWithFrame:(CGRect) frame BoldFontSize:(CGFloat)size Color:(UIColor *)color{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:size];
    label.textColor = color;
    return label;
}

+ (UIView *)zeroView
{
    return [GKUIFactory viewWithFrame:CGRectZero];
}

+ (UIView *)viewWithFrame:(CGRect)frame
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    return view;
}

+ (UIView *)viewWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = bgColor;
    return view;
}

+ (UIImageView *)zeroImageView
{
    return [GKUIFactory zeroImageViewWithFrame:CGRectZero];
}

+ (UIImageView *)zeroImageViewWithFrame:(CGRect)frame
{
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:frame];
    return imgV;
}

+ (UIButton *)zeroButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    return button;
}
@end
