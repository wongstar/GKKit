//
//  UIButton+Util.m
//  GKKitSample
//
//  Created by gk on 2017/7/21.
//  Copyright © 2017年 star. All rights reserved.
//

#import "UIButton+GKUtil.h"

@implementation UIButton (GKUtil)

-(void)textAndImageLayoutCenter{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width, 0, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -self.titleLabel.intrinsicContentSize.width);
}


-(void)textLayoutImageRight:(CGFloat)offset{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, offset, 0, 0);
    self.imageEdgeInsets = UIEdgeInsetsZero;
}


-(void)textLayoutImageBelow:(CGFloat)offset{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width, -self.imageView.frame.size.height-offset/2, 0);
    
    self.imageEdgeInsets = UIEdgeInsetsMake(-self.titleLabel.intrinsicContentSize.height-offset/2, 0, 0, -self.titleLabel.intrinsicContentSize.width);
}


-(void)textLayoutImageLeft:(CGFloat)offset{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width - self.frame.size.width + self.titleLabel.intrinsicContentSize.width, 0, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -self.titleLabel.frame.size.width - self.frame.size.width + self.imageView.frame.size.width);
}

@end
