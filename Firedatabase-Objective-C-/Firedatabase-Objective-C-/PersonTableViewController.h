//
//  PersonTableViewController.h
//  Firedatabase-Objective-C-
//
//  Created by Ethan Hess on 3/19/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirebaseRef.h"
#import <Firebase.h>
#import "NSObject+Constants.h"
#import "StyleController.h"

@interface PersonTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray <NSDictionary *> *items;

@end
