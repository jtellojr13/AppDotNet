//
//  main.m
//  AppDotNetReader
//
//  Created by Jesse Tello on 5/17/13.
//  Copyright (c) 2013 Tello. All rights reserved.
////
////Weekend Hack:
//The hack is to make a basic App.net (similar to twitter) reader.  Similar to the Wikipedia client, use this URL to get a set of sample posts: https://alpha-api.app.net/stream/0/posts/stream/global .  Inspect the resulting data and convert it into Arrays and Dictionaries.  Show the posts with their authors in a table view.
//
//Version 1.0:
//When a user taps on the table row, show the recent posts made by that user.
//
//Hint: use this URL to get the posts: https://alpha-api.app.net/stream/0/users/NUMERICAL_ID_OF_USER/posts
//
//Upgrades:
//-Show a UIActivityIndicatorView on the screen while the app is waiting for Wikipedia to respond.  Stop showing the indicator view when the results are available.
//-Add a refresh button to reload the global timeline
//
////

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
