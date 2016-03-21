//
//  AddPersonViewController.h
//  Firedatabase-Objective-C-
//
//  Created by Ethan Hess on 3/18/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirebaseRef.h"
#import "StyleController.h"
#import "NSObject+Constants.h"

@interface AddPersonViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *dateOfBirthTextField;
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, weak) IBOutlet UIButton *photoButton;

@property (nonatomic, assign) NSTimeInterval dateOfBirthTimeInterval;
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImage *chosenImage; 

@end
