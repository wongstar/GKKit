//
//  GKArrayDataSource.h
//  GKKitSample
//
//  Created by igeak on 2017/8/28.
//  Copyright © 2017年 star. All rights reserved.
//


/*
How to user...
*****
 
 - (void)setupTableView
 {
 TableViewCellConfigureBlock configureCell = ^(PhotoCell *cell, Photo *photo) {
 [cell configureForPhoto:photo];
 };
 NSArray *photos = [AppDelegate sharedDelegate].store.sortedPhotos;
 self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:photos
 cellIdentifier:PhotoCellIdentifier
 configureCellBlock:configureCell];
 self.tableView.dataSource = self.photosArrayDataSource;
 [self.tableView registerNib:[PhotoCell nib] forCellReuseIdentifier:PhotoCellIdentifier];
 }
 
 */


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface GKArrayDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
