//
//  ViewController.h
//  AppDotNetReader
//
//  Created by Jesse Tello on 5/17/13.
//  Copyright (c) 2013 Tello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)refreshFeed:(id)sender;


@end
