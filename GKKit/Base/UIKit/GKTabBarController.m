//
//  GKTabBarController.m
//  GKFramework
//
//  Created by gk on 2017/7/12.
//  Copyright © 2017年 star. All rights reserved.
//

#import "NSBundle+GKUtil.h"
#import "GKTabBarController.h"
#import "UIColor+GKUtil.h"

@interface GKTabBarController (){
    BOOL hasNormalImages;
    BOOL hasSelectedImages;
}

@end

@implementation GKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSArray *)tabNormalImages{
    
    hasNormalImages=true;
    if(_tabNormalImages == nil ){
        
        hasNormalImages=false;
         _tabNormalImages = @[@"tab_btn_activity",@"tab_btn_activity",@"tab_btn_activity",@"tab_btn_activity",@"tab_btn_activity"];
        
    }
    return _tabNormalImages;
}


-(NSArray *)tabSelectedImages{
    
    hasSelectedImages=true;
    if(_tabSelectedImages == nil ){
          hasSelectedImages=false;
    _tabSelectedImages=@[@"tab_btn_activity_clicked",@"tab_btn_activity_clicked",@"tab_btn_activity_clicked",@"tab_btn_activity_clicked",@"tab_btn_activity_clicked"];
        
    }
    
    return _tabSelectedImages;
}

-(NSArray *)tabTexts{
    if(_tabTexts == nil){
        _tabTexts=@[@"1",@"2",@"3",@"4",@"5"];
    }
    
    return _tabTexts;
}

-(NSMutableDictionary *)textAttrs{
    if (_textAttrs == nil) {
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        _textAttrs=[textAttrs copy];
    }
    
    return _textAttrs;
}


-(NSMutableDictionary *)selectTextAttrs{
    if (_selectTextAttrs == nil ){
        NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
        selectTextAttrs[NSForegroundColorAttributeName] =[UIColor colorWithHexCode:@"660000"];
        selectTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        _selectTextAttrs=[selectTextAttrs copy];
    }
    return _selectTextAttrs;
}

-(void)initTabWithVC:(NSArray *)vc{
    [self initTabWithVC:vc withTabNormalImages:self.tabNormalImages withTabSelectedImage:self.tabSelectedImages withText:self.tabTexts];
}

-(void)initTabWithVC:(NSArray *)vc withTabNormalImages:(NSArray *)normalImages withTabSelectedImage:(NSArray *)selectedImages withText:(NSArray *)texts{
    

    NSCAssert(!(vc.count==normalImages.count==selectedImages.count==texts.count),@"the array count must equal.");
    
    for(int i=0;i<vc.count;i++){
        [self addChildVC:[vc objectAtIndex:i] title:[texts objectAtIndex:i] normalImage:[normalImages objectAtIndex:i] selectedImage:[selectedImages objectAtIndex:i]];
    }
    
}






- (void)addChildVC:(UIViewController *)childVC title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage
{
    
    childVC.tabBarItem.title = title;
 
    
    if(!hasNormalImages){
        childVC.tabBarItem.image = [UIImage imageNamedWithGK:normalImage];
    }else{
        childVC.tabBarItem.image = [UIImage imageNamed:normalImage];
    }
    
    
    if(!hasSelectedImages){
         childVC.tabBarItem.selectedImage = [[UIImage imageNamedWithGK:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    [childVC.tabBarItem setTitleTextAttributes:self.textAttrs forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:self.selectTextAttrs forState:UIControlStateSelected];
    [self addChildViewController:childVC];
}


-(void)addCenterButtonWithBlock:(GKActionWithBlock)block{
    [self addCenterButtonWithImage:nil witchBlock:block];
}

-(void)addCenterButtonWithImage:(NSString *)imageName witchBlock:(GKActionWithBlock)block
{
    _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.centerButtonBlock = block;
    CGPoint origin = [self.view convertPoint:self.tabBar.center toView:self.tabBar];
    CGSize buttonSize = CGSizeMake(self.tabBar.frame.size.width / 5 - 6, self.tabBar.frame.size.height - 4);
    
    _centerButton.frame = CGRectMake(origin.x - buttonSize.height/2, origin.y - buttonSize.height/2 + 0.5, buttonSize.height, buttonSize.height);
    UIImage *image;
    if(imageName==nil){
        image=[UIImage imageNamedWithGK:@"tab_btn_add"];
    }else{
        image=[UIImage imageNamed:imageName];
    }
    
    [_centerButton setImage:image forState:UIControlStateNormal];
    
    
    [_centerButton addTarget:self action:@selector(centerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}



-(void)centerButtonPressed:(UIButton *)button{
    if(self.centerButtonBlock){
        self.centerButtonBlock(button, button);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
