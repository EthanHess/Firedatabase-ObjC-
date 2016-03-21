//
//  NSObject+Constants.h
//  Firedatabase-Objective-C-
//
//  Created by Ethan Hess on 3/18/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase.h>
@import UIKit;

//static strings
static NSString * const nameKey = @"name";
static NSString * const dobKey = @"dob";
static NSString * const base64StringKey = @"base64";

@interface NSObject (Constants)

- (UIColor *)mainColor;

- (UIColor *)barTintColor;

- (UIColor *)barTextColor;

- (UIColor *)backgroundColor;

- (UIColor *)secondaryColor;

- (UIColor *)textColor;

- (UIColor *)headingTextColor;

- (UIColor *)subtitleTextColor;

- (UIFont *)standardTextFont;

- (UIFont *)subtitleFont;

- (UIFont *)headlineFont; 

@end
