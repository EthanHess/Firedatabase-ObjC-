//
//  FirebaseRef.h
//  Firedatabase-Objective-C-
//
//  Created by Ethan Hess on 3/18/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase.h>

@interface FirebaseRef : NSObject

+ (FirebaseRef *)sharedInstance;

@property (nonatomic, strong) Firebase *firebaseReference; 

@end
