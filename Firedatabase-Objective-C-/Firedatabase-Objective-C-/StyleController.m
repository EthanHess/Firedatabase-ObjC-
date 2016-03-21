//
//  StyleController.m
//  Firedatabase-Objective-C-
//
//  Created by Ethan Hess on 3/18/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import "StyleController.h"

@implementation StyleController

+ (StyleController *)sharedInstance {
    static StyleController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [StyleController new];
    });
    
    return sharedInstance;
    
}

- (void)applyTheme {
    
    UIApplication *sharedApplication = [UIApplication sharedApplication];
    sharedApplication.delegate.window.tintColor = [UIColor mainColor];
    sharedApplication.statusBarStyle = UIStatusBarStyleLightContent;
    
    [self styleForNavigationBar];
    [self styleForTableView];
}

- (void)styleForNavigationBar {
    
    [UINavigationBar appearance].barTintColor = [UIColor blueColor];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    //add font
    [UINavigationBar appearance].titleTextAttributes = @{NSFontAttributeName: [self standardTextFont], NSForegroundColorAttributeName: [UIColor whiteColor]}; 
}

- (void)styleForTableView {
    
    [UITableView appearance].backgroundColor = [UIColor cyanColor];
    [UITableView appearance].separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (NSString *)formatDate:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
    
}


@end
