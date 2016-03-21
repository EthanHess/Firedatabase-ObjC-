//
//  PersonTableViewController.m
//  Firedatabase-Objective-C-
//
//  Created by Ethan Hess on 3/19/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import "PersonTableViewController.h"

@interface PersonTableViewController ()

@end

@implementation PersonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadFirebaseData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView reloadData]; 
}

- (void)loadFirebaseData {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [[FirebaseRef sharedInstance].firebaseReference observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        
        NSMutableArray *tempItemsArray = [NSMutableArray new];
        
        for (id item in snapshot.children) {
            
            FDataSnapshot *child = item;
            
            NSDictionary *dictionary = child.value;
            
            [tempItemsArray addObject:dictionary];
        }
        
        self.items = tempItemsArray;
        [self.tableView reloadData];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    [self tableViewStyle:cell]; 
    
    return cell;
}

#pragma Cell Config.

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dictionary = self.items[indexPath.row];
    
    cell.textLabel.text = dictionary[nameKey];
    
    NSTimeInterval dobTimeInterval = [dictionary[dobKey] doubleValue];
    [self configureTimeInterval:dobTimeInterval forCell:cell];
    
    NSString *base64String = dictionary[base64StringKey];
    [self populateImage:base64String cell:cell];
    
}

- (void)configureTimeInterval:(NSTimeInterval)interval forCell:(UITableViewCell *)cell {
    
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSinceNow:interval];
    NSString *dateString = [[StyleController sharedInstance]formatDate:date];
    
    cell.detailTextLabel.text = dateString;
}

- (void)populateImage:(NSString *)string cell:(UITableViewCell *)cell {
    
    NSData *decodedData = [[NSData alloc]initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    UIImage *decodedImage = [UIImage imageWithData:decodedData];
    cell.imageView.image = decodedImage;
    
}

- (void)tableViewStyle:(UITableViewCell *)cell {
    
    cell.contentView.backgroundColor = [UIColor backgroundColor];
    cell.backgroundColor = [UIColor backgroundColor];
    
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15];
    
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.backgroundColor = [UIColor backgroundColor];
    
    cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:15];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.backgroundColor = [UIColor backgroundColor];
}

#pragma Row Deletion

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSDictionary *dictionary = self.items[indexPath.row];
        NSString *name = dictionary[nameKey];
        
        Firebase *profile = [[FirebaseRef sharedInstance].firebaseReference childByAppendingPath:name];
        [profile removeValue];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
