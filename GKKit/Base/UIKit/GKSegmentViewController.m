//
//  GKSegmentViewController.m
//  GKKitSample
//
//  Created by igeak on 2017/7/31.
//  Copyright © 2017年 star. All rights reserved.
//

#import "GKSegmentViewController.h"
#import "GKSegmentedControl.h"
#import "GKKitMacro.h"

@interface GKSegmentViewController ()<UIScrollViewDelegate>{
    CGFloat vcWidth;  // 每个子视图控制器的视图的宽
    CGFloat vcHeight; // 每个子视图控制器的视图的高
    float lastOffset;
    BOOL _isDrag;
}

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation GKSegmentViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.segmentHeight=40;
    //[self prepare];
    // Do any additional setup after loading the view.
}

#pragma mark for sub  view..
- (void)prepare:(GKSegmentedControl *)segementControl{
    self.segementControl=segementControl;
    [self addSegementLinster];
    [self setupScrollView];
    [self setupViewControllers];
    [self.view bringSubviewToFront:_segementControl];
}

-(GKSegmentedControl *)segementControl{
    if(_segementControl==nil){
        [self setupGKSegementControl];
    }
    
    return _segementControl;
}



-(void)addSegementLinster{
    [self.segementControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
}

-(void)setupGKSegementControl{
    CGFloat Y = 0.0f;
    if (self.navigationController != nil && ![self.navigationController isNavigationBarHidden]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        Y = 64.0f;
    }
    if(self.segmentLocation==GKSegmentBottom){
        BOOL isHidden=[self.navigationController isToolbarHidden];
        if(isHidden){
            Y=kScreenHeight-self.segmentHeight;
        }else{
            Y=kScreenHeight-self.segmentHeight-44;
        }
    }
    _segementControl=[[GKSegmentedControl alloc] initWithSectionTitles:self.titles];
    _segementControl.frame = CGRectMake(0, Y, kScreenWidth, self.segmentHeight);
    _segementControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:_segementControl];
}

/** 设置scrollView */
- (void)setupScrollView
{
    CGFloat Y = 0.0f;
    if (self.navigationController != nil && ![self.navigationController isNavigationBarHidden]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        Y = 64.0f;
    }
   
    
    if(self.segmentLocation==GKSegmentBottom){
        BOOL isHidden=[self.navigationController isToolbarHidden];
        if(isHidden){
            vcHeight=kScreenHeight-self.segmentHeight;
        }else{
            vcHeight=kScreenHeight-self.segmentHeight-44;
        }
    }else{
         Y=Y+_segementControl.height;
    }
    
    vcWidth = self.view.frame.size.width;
    vcHeight = self.view.frame.size.height - Y;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, Y, vcWidth, vcHeight)];
    scrollView.contentSize = CGSizeMake(vcWidth * self.viewControllers.count, vcHeight);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator   = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate      = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
   
}

/** 设置子视图控制器，这个方法必须在viewDidLoad方法里执行，否则子视图控制器各项属性为空 */
- (void)setupViewControllers
{
    int cnt = (int)self.viewControllers.count;
    for (int i = 0; i < cnt; i++) {
        UIViewController *vc = self.viewControllers[i];
        [self addChildViewController:vc];
        
        vc.view.frame = CGRectMake(vcWidth * i, 0, vcWidth, vcHeight);
        [self.scrollView addSubview:vc.view];
    }
    lastOffset=(cnt-1)*vcWidth;
}

#pragma makr -Segement callback..

- (void)segmentedControlChangedValue:(GKSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    
    [self.scrollView scrollRectToVisible:CGRectMake(segmentedControl.selectedSegmentIndex*vcWidth, 0, vcWidth, vcHeight) animated:YES];
}



#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
   
    _isDrag = YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.x<0){
        [scrollView setContentOffset:CGPointMake(0, scrollView.contentOffset.y) animated:NO];
    }
   
    if(scrollView.contentOffset.x>lastOffset){
        [scrollView setContentOffset:CGPointMake(lastOffset, scrollView.contentOffset.y) animated:NO];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    [_segementControl setSelectedSegmentIndex:index animated:YES];

    _isDrag = NO;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
