###GKKit

- An easy way to use pull-to-refresh
- Collect a lot of useful Category.
- An easy way to use Tab UI 
- An easy way to use Navigation 
- Collect a lot of useful view.

![79A6981A-D83D-48C4-B692-5E4A3456CF77.png](http://upload-images.jianshu.io/upload_images/2155810-0cd9ee94a9f87fc2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/480)

Code Parsing
Base -->GKBaseUIController,GKBaseTableViewController,GKTabbar and some useful category.
GKResource.bundle -->put all the resource  in this bundle.
Utils -->some utils class
View -->custom views such as Toast

###Demo Project
![Screen Shot 2017-07-25 at 下午6.00.05.png](http://upload-images.jianshu.io/upload_images/2155810-8d15ed0ec0b5596e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/480)

```
self.tabNormalImages=@[@"one",@"two",@"",@"three",@"four"];
    self.tabSelectedImages=@[@"one_selected",@"two_selected",@"",@"three_selected",@"four_selected"];
    self.tabTexts=@[LSTR(@"tab_one_title"),LSTR(@"tab_two_title"),LSTR(@""),LSTR(@"tab_three_title"),LSTR(@"tab_four_title")];
    
    [self initTabWithVC:vc];
    
    //
    [self addCenterButtonWithBlock:^(id sender, id obj) {
        debugLog(@".... click...");
    }];
```

add tarbar normal  list icons and selected list icons ,if you want add button in the 

![Screen Shot 2017-07-25 at 下午6.00.12.png](http://upload-images.jianshu.io/upload_images/2155810-ca63021f07d4c909.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/480)
-------


```
   self.hasPullToRefresh=true; //show pull refresh action
   self.hasLoadMore=true;//show load more action
   self.isGifHeader=true; //show gif animation

//loadMore will callback
-(void)loadMore{
    debugLog(@"LoadMore...");
}
//pull to refresh will call back.
-(void)pullToRefresh{
    debugLog(@"pull to referesh..");
    
    dispatch_after(dispatch_time_delay(2), dispatch_get_main_queue(), ^{
        [self headerEndFrefreshing];
    });
}
```


###Installation

--------

CocoaPods
1.Add pod 'GKKit' to your Podfile
2.Run pod install or pod update.
3.Import <GKKit/GKKit.h>

Manually
1.Download all the files in the 'GKKit' subdirectory.
2.Add the source files to your Xcode project.
3.Import <GKKit/GKKit.h>


--------
###License
GKKit is provided under the MIT license. See LICENSE file for details.


if you like it, please click star button .Thanks!
