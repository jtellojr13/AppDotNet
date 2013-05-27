//
//  RecentPostsViewController.h
//  AppDotNetReader
//
//  Created by Jesse Tello on 5/19/13.
//  Copyright (c) 2013 Tello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecentPostsViewController : UITableViewController

@property(strong,nonatomic) NSMutableDictionary* passedDictionary;
@property(strong,nonatomic) NSString* passedID;

@end
