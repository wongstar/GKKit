//
//  NSNumber+GKUtil.h
//  GKKitSample
//
//  Created by gk on 2017/7/14.
//  Copyright © 2017年 star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (GKUtil)

/**
 Creates and returns an NSNumber object from a string.
 Valid format: @"12", @"12.345", @" -0xFF", @" .23e99 "...
 
 @param string  The string described an number.
 
 @return an NSNumber when parse succeed, or nil if an error occurs.
 */
+ (nullable NSNumber *)numberWithString:(NSString *)string;

@end
