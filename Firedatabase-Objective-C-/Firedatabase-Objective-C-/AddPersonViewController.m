//
//  AddPersonViewController.m
//  Firedatabase-Objective-C-
//
//  Created by Ethan Hess on 3/18/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import "AddPersonViewController.h"

@interface AddPersonViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation AddPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self applyStyle]; 
    
}

- (void)applyStyle {
    
    self.view.backgroundColor = [UIColor backgroundColor];
    
    self.nameTextField.font = [UIFont standardTextFont];
    self.nameTextField.textColor = [UIColor whiteColor];
    
    self.dateOfBirthTextField.font = [UIFont standardTextFont];
    self.dateOfBirthTextField.textColor = [UIColor whiteColor];
    
    self.datePicker.backgroundColor = [UIColor backgroundColor];
}

- (IBAction)save:(id)sender {
    
    NSString *name = self.nameTextField.text;
    NSData *data = [[NSData alloc]init];
    
    if (self.chosenImage) {
        
        data = UIImageJPEGRepresentation(self.chosenImage, 0.1);
    }
    
    NSString *base64String = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    //make subclass eventually
    NSDictionary *user = @{nameKey: name, dobKey: [NSNumber numberWithDouble:self.dateOfBirthTimeInterval], base64StringKey: base64String};
    
    Firebase *profile = [[FirebaseRef sharedInstance].firebaseReference childByAppendingPath:name];
    
    [profile setValue:user];
}

- (IBAction)datePicked:(id)sender {
    
    self.dateOfBirthTimeInterval = self.datePicker.date.timeIntervalSinceNow;
    
    self.dateOfBirthTextField.text = [[StyleController sharedInstance]formatDate:self.datePicker.date];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

#pragma Image Picker Del. methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
    
    self.chosenImage = info[UIImagePickerControllerOriginalImage];
    [self.photoButton setBackgroundImage:self.chosenImage forState:UIControlStateNormal];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)addPicture:(id)sender {
    
    self.imagePicker = [UIImagePickerController new];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        self.imagePicker.delegate = self;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:self.imagePicker animated:YES completion:nil]; ;
    } else {
        
        self.imagePicker.allowsEditing = NO;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.imagePicker.delegate = self;
        [self presentViewController:self.imagePicker animated:YES completion:nil]; 
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
