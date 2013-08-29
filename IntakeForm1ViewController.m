//
//  IntakeForm1ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/28/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "IntakeForm1ViewController.h"

@interface IntakeForm1ViewController ()

@end

@implementation IntakeForm1ViewController

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
    
    //--- down modal setting
    CGRect tmpRect = _modalView.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = self.view.frame.size.height;
    _modalView.frame = tmpRect;
    [self.view addSubview:_modalView];
    
    //--- Date of Birth Setting ---//
    _lb_dataOfBirth.text = [self dateToString:[NSDate date]];
}

- (NSString *)dateToString:(NSDate *)date {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm:ss"];

    NSString *theDate = [dateFormat stringFromDate:date];
//    NSString *theTime = [timeFormat stringFromDate:now];
    return theDate;
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
    if(indexPath.section == 0 && indexPath.row == 1) {
        //--- Date of Birth ---//
        [self modalUp:nil];
    }
}

#pragma mark - Custom Method
- (IBAction)modalUp:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
    
    CGRect tmpRect = _modalView.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = self.view.frame.size.height - _modalView.frame.size.height;
    _modalView.frame = tmpRect;
    
    [UIView commitAnimations];
    
    //--- keyboard down ---/
    [_tf_healthCardNumber resignFirstResponder];
}

- (IBAction)modalDown:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
    
    CGRect tmpRect = _modalView.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = self.view.frame.size.height;
    _modalView.frame = tmpRect;
    
    [UIView commitAnimations];
}

- (IBAction)btn_confirm:(id)sender {
    [self modalDown:nil];
    _lb_dataOfBirth.text = [self dateToString:_dp_dateOfBirth.date];
}

#pragma TextField delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self modalDown:nil];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_tf_healthCardNumber resignFirstResponder];
    return YES;
}

@end
