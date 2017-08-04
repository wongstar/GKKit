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
#import "GKUINavigationController.h"

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


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.tabBar.items[2] setEnabled:false];
//    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        debugLog(@"the idx is %d",idx);
//    }];
    //debugLog(@"the count of tabar %d",self.tabBar.items.count);
    
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

-(void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex=selectIndex;
    self.selectedIndex=_selectIndex;
}

-(void)initTabWithVC:(NSArray *)vc{
    [self initTabWithVC:vc withTabNormalImages:self.tabNormalImages withTabSelectedImage:self.tabSelectedImages withText:self.tabTexts];
}

-(void)initTabWithVC:(NSArray *)vc withTabNormalImages:(NSArray *)normalImages withTabSelectedImage:(NSArray *)selectedImages withText:(NSArray *)texts{
    

    NSCAssert(!(vc.count==normalImages.count==selectedImages.count==texts.count),@"the array count must equal.");
    
    self.viewControllers=vc;
    
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
    
}




-(void)buttonInToolBarWithNormalImage:(NSString *)normal withSelectedImage:(NSString *)selected withIndex:(NSInteger)index withBlock:(GKActionWithBlock)block{
    
    
    self.tabBar.items[index].enabled=false;
    //debugLog(@"the tabBar.item")
    
    NSInteger count =_tabNormalImages.count;
    GKAssertNil(count==0, @"tabBar count must large zero");
    float width = self.tabBar.width;
    CGSize buttonSize = CGSizeMake(self.tabBar.frame.size.height - 4, self.tabBar.frame.size.height - 4);
    
    float itemWidth = width/count;
    
    float x = index*itemWidth+(itemWidth-buttonSize.width)/2;
    float y= (self.tabBar.height-buttonSize.height)/2;
    
    
    self.centerButtonBlock = block;
    
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(x, y,buttonSize.width,buttonSize.height)];
    
    UIImage *normalImage;
    if(normal==nil){
        normalImage=[UIImage imageNamedWithGK:@"tab_btn_add"];
    }else{
        normalImage=[UIImage imageNamed:normal];
    }
    
    UIImage *selectedImage;
    if(selected == nil ){
        selectedImage = [UIImage imageNamedWithGK:@"tab_btn_add_selected"];
    } else {
        selectedImage = [UIImage imageNamed:selected];
    }
    
    
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    
    [button addTarget:self action:@selector(centerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBar addSubview:button];
    
}


-(void)addCenterButtonWithBlock:(GKActionWithBlock)block{
    [self addCenterButtonWithNormalImage:nil withSeletedImageName:nil witchBlock:block];
}

-(void)addCenterButtonWithNormalImage:(NSString *)normlName  withSeletedImageName:(NSString *)selectedImageName witchBlock:(GKActionWithBlock)block
{
    
    NSInteger count =_tabNormalImages.count;
    GKAssertNil(count==0, @"tabBar count must large zero");
    
    [self buttonInToolBarWithNormalImage:normlName withSelectedImage:selectedImageName withIndex:count/2 withBlock:block];
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
