//
//  NSTimer+GKTimer.m
//  GKKitSample
//
//  Created by igeak on 2017/7/14.
//  Copyright © 2017年 star. All rights reserved.
//

#import "NSTimer+GKUtil.h"

@implementation NSTimer (GKUtil)

+ (void)_gk_ExecBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    __weak typeof(self) weakself = self;
    
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:weakself selector:@selector(_gk_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    __weak typeof(self) weakself = self;
    return [NSTimer timerWithTimeInterval:seconds target:weakself selector:@selector(_gk_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

@end
