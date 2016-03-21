//
//  FirebaseRef.m
//  Firedatabase-Objective-C-
//
//  Created by Ethan Hess on 3/18/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import "FirebaseRef.h"

@implementation FirebaseRef

+ (FirebaseRef *)sharedInstance {
    static FirebaseRef *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [FirebaseRef new];
    });
    
    return sharedInstance;
    
}

- (Firebase *)firebaseReference {
    
    return [[Firebase alloc]initWithUrl:@"https://personlist-objc.firebaseio.com"];
}

@end
