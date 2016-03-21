//
//  StyleController.h
//  Firedatabase-Objective-C-
//
//  Created by Ethan Hess on 3/18/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Constants.h"
@import UIKit;

@interface StyleController : NSObject

+ (StyleController *)sharedInstance;

- (void)applyTheme;

- (void)styleForNavigationBar;

- (void)styleForTableView;

- (NSString *)formatDate:(NSDate *)date;

@end
