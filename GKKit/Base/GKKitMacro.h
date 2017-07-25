//
//  GKKitMacro.h
//  GKKitSample
//
//  Created by gk on 2017/7/14.
//  Copyright © 2017年 star. All rights reserved.
//

#ifndef GKKitMacro_h
#define GKKitMacro_h
#import <sys/time.h>
#import <pthread.h>
#import "NSBundle+GKUtil.h"
#import "NSDate+GKUtil.h"
#import "NSString+GKUtil.h"
#import "NSNumber+GKUtil.h"
#import "NSTimer+GKUtil.h"
#import "NSNotificationCenter+GKUtil.h"
#import "CALayer+GKUtil.h"
#import "UIView+GKUtil.h"
#import "UIColor+GKUtil.h"
#import "UIImage+GKUtil.h"
#import "UIButton+GKUtil.h"
#import "UILabel+Util.h"

#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif


#define SHARED_INSTANCE_USING_GCD_ID_IMPL                   \
\
+ (instancetype)sharedInstance {                            \
\
static dispatch_once_t pred;                            \
__strong static id _sharedInstance = nil;               \
dispatch_once( &pred, ^{                                \
_sharedInstance = [[self alloc] init];              \
});                                                     \
return _sharedInstance;                                 \
}



#define WeakSelf(type)  __weak typeof(type) weak##type = type
#define StrongSelf(type)  __strong typeof(type) type = weak##type

#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

#define NOTIF_ADD(n, f)     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(f) name:n object:nil]
#define NOTIF_POST(n, o)    [[NSNotificationCenter defaultCenter] postNotificationName:n object:o]
#define NOTIF_REMV()        [[NSNotificationCenter defaultCenter] removeObserver:self]



#define GKAssertNil(condition, description, ...) NSAssert(!(condition), (description), ##__VA_ARGS__)
#define GKCAssertNil(condition, description, ...) NSCAssert(!(condition), (description), ##__VA_ARGS__)

#define GKAssertNotNil(condition, description, ...) NSAssert((condition), (description), ##__VA_ARGS__)
#define GKCAssertNotNil(condition, description, ...) NSCAssert((condition), (description), ##__VA_ARGS__)

#define GKAssertMainThread() NSAssert([NSThread isMainThread], @"This method must be called on the main thread")
#define GKCAssertMainThread() NSCAssert([NSThread isMainThread], @"This method must be called on the main thread")



// App Frame
#define Application_Frame       [[UIScreen mainScreen] applicationFrame]

// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

// View 坐标(x,y)和宽高(width,height)
#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y
#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

#define     kNaviBarBgColor        colorFromRGB(0xdf3132)
// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define handle_tap(view, delegate, selector) do {\
view.userInteractionEnabled = YES;\
[view addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:delegate action:selector]];\
} while(0)


#define kButtonNormalSize   60

#define kImageEditorBottomItemSize   105
#define kImageEditorMaxImageSize     1242

#define LSTR(str)       NSLocalizedString(str, nil)
#define kNavigationTitleFontSize    18.

#define kCellBgImgInsetNomarl         UIEdgeInsetsMake(0, 0, 10.0, 0)
#define kCellBgImgInsetOpen           UIEdgeInsetsMake(0, 0, 0, 0)

#define MoveTo(view, x, y)          view.frame = CGRectMake(x, y, view.frame.size.width, view.frame.size.height)

#define colorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define gkColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define colorFromRGBA(rgbValue,trans) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:trans]


#define kCellDescriptionFont            [UIFont systemFontOfSize:14]

#define kOnePixelsLineHeight            1/[UIScreen mainScreen].scale

#define kLoginButtonBGEdgeInsets        UIEdgeInsetsMake(4, 4, 4, 4)
#define kTextFieldHeight                44
#define KButtonHeight                   45

#define KTextGapHeight                  10
#define kButtonGapHeight                10
#define kTextButtonGapHeight            10

#define kScreenWidth                    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define SET_NAVIGATION_TITLE(title)         SET_NAVIGATION_TITLE_WITH_LIMIT_WIDTH(title, 240)
#define SET_NAVIGATION_TITLE_WITH_LIMIT_WIDTH(title, limit)     \
do {\
if (1 == self.navigationItem.titleView.tag) {\
for (UILabel *label in [self.navigationItem.titleView subviews]) {\
if ([label isKindOfClass:[UILabel class]]) {\
label.text = title;\
[label sizeToFit]; \
CGRect rect = label.frame;\
rect.size.width = MIN(label.frame.size.width, limit);\
label.frame = rect;\
CGRect rect2 = self.navigationItem.titleView.frame;\
if (rect.size.width<rect2.size.width) { \
rect.size.width = rect2.size.width; \
label.frame = rect; \
} \
else { \
rect2.size.width = rect.size.width; \
self.navigationItem.titleView.frame = rect2;\
} \
} \
} \
} \
else {\
UIView *view = [[UIView alloc] init];\
view.backgroundColor = [UIColor clearColor];\
view.tag = 1;\
UILabel *label = [[UILabel alloc] init]; \
label.backgroundColor = [UIColor clearColor]; \
label.textColor = [UIColor blackColor]; \
label.font = [UIFont boldSystemFontOfSize:kNavigationTitleFontSize]; \
label.text = title; \
label.lineBreakMode = NSLineBreakByCharWrapping;\
label.textAlignment = NSTextAlignmentCenter;\
[label sizeToFit]; \
[view addSubview:label];\
CGRect rect = label.frame;\
rect.size.width = MIN(label.frame.size.width, limit);\
label.frame = rect;\
view.frame = label.frame;\
self.navigationItem.titleView = view;\
}\
} while (0)


#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define XM_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define XM_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define XM_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define XM_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif


#ifndef GK_CLAMP // return the clamped value
#define GK_CLAMP(_x_, _low_, _high_)  (((_x_) > (_high_)) ? (_high_) : (((_x_) < (_low_)) ? (_low_) : (_x_)))
#endif

#ifndef GK_SWAP // swap two value
#define GK_SWAP(_a_, _b_)  do { __typeof__(_a_) _tmp_ = (_a_); (_a_) = (_b_); (_b_) = _tmp_; } while (0)
#endif

// 黑色
#define     kTextColorLevel1       colorFromRGB(0x000000)

#define kUseScreenShotGesture  1

/**
 Returns a dispatch_time delay from now.
 */
static inline dispatch_time_t dispatch_time_delay(NSTimeInterval second) {
    return dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC));
}

/**
 Returns a dispatch_wall_time delay from now.
 */
static inline dispatch_time_t dispatch_walltime_delay(NSTimeInterval second) {
    return dispatch_walltime(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC));
}

/**
 Returns a dispatch_wall_time from NSDate.
 */
static inline dispatch_time_t dispatch_walltime_date(NSDate *date) {
    NSTimeInterval interval;
    double second, subsecond;
    struct timespec time;
    dispatch_time_t milestone;
    
    interval = [date timeIntervalSince1970];
    subsecond = modf(interval, &second);
    time.tv_sec = second;
    time.tv_nsec = subsecond * NSEC_PER_SEC;
    milestone = dispatch_walltime(&time, 0);
    return milestone;
}

/**
 Whether in main queue/thread.
 */
static inline bool dispatch_is_main_queue() {
    return pthread_main_np() != 0;
}

/**
 Submits a block for asynchronous execution on a main queue and returns immediately.
 */
static inline void dispatch_async_on_main_queue(void (^block)()) {
    if (pthread_main_np()) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

/**
 Submits a block for execution on a main queue and waits until the block completes.
 */
static inline void dispatch_sync_on_main_queue(void (^block)()) {
    if (pthread_main_np()) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}


/**
   -------------start block code------------------------
 */


/**
 this block return void and param is void.
 */
typedef void (^GKVoidBlock)(void);



/**
 this block return void and add a param object.

 @param  object
 */
typedef void (^GKActionBlock)(id object);



//sender self, obj param.
typedef void (^GKActionWithBlock)(id sender,id obj);



//complet
typedef void (^GKActionCompletionBlock)(id object,NSError *error);


/*
 --------------------end block code---------------------
 */

#endif /* GKKitMacro_h */


