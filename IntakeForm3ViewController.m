//
//  IntakeForm3ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "IntakeForm3ViewController.h"
#import "Clipboard.h"
#import "StackMob.h"

@interface IntakeForm3ViewController ()

@end

@implementation IntakeForm3ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - custom method

- (void)saveCurrentScreenData {
//    dashboard.occur_date = _lb_date.text;
//    dashboard.visit_type = _tf_visitType.text;
//    dashboard.billingcode = _tf_billingCode.text;
}
- (IBAction)save_local:(id)sender {
    [self saveCurrentScreenData];
    
    dashboard.status = @"Local";
    //    Clipboard *clip = [Clipboard sharedClipboard];
    //    [clip clipValue:dashboard clipKey:@"local_dashboard"];
    
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    // An asynchronous Core Data save method provided by the StackMob iOS SDK.
    
    [context saveOnSuccess:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    } onFailure:^(NSError *error) {
        NSLog(@"Error saving todo: %@", error);
    }];
    
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveLocalData" object:dashboard];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        // OK
        NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
        // An asynchronous Core Data save method provided by the StackMob iOS SDK.
        [context deleteObject:dashboard];
        [context saveOnSuccess:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } onFailure:^(NSError *error) {
            NSLog(@"Error saving todo: %@", error);
        }];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
}

- (IBAction)cancel_local:(id)sender {
    // delete
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Are you sure you want to delete the selected item?"
                                                   delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.delegate = self;
    [alert show];
    
}



@end
