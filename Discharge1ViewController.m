//
//  Discharge1ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/1/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "Discharge1ViewController.h"
#import "StackMob.h"
#import "Clipboard.h"
#import "Utility.h"

@interface Discharge1ViewController ()

@end

@implementation Discharge1ViewController

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
    datePickerViewController = [[NewDatePickerViewController alloc] initWithNibName:@"NewDatePickerViewController" bundle:nil];
    datePickerView = [datePickerViewController getDatePickerView:self];
    [self.view addSubview:datePickerView];
    
    _lb_discharge_date.text = [Utility dateToString:[NSDate date]];
    _lb_admission_date.text = [Utility dateToString:[NSDate date]];

//    UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)];
//    self.navigationItem.rightBarButtonItem = confirmButton;
    
    //--- Data prepare ---//
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    dashboard = [NSEntityDescription insertNewObjectForEntityForName:@"Dashboard" inManagedObjectContext:context];
    //--- initiallize dashboard data---//
    dashboard.dashboard_id = [dashboard assignObjectId];
    dashboard.patient_status = @"Discharge";
    dashboard.event_days = @"0 days";
    dashboard.event_0 = @"";
    dashboard.event_1 = @"";
    dashboard.event_2 = @"";
    dashboard.event_3 = @"";
    dashboard.event_4 = @"";
    dashboard.event_5 = @"";
    dashboard.event_6 = @"";
    dashboard.event_7 = @"";
    dashboard.event_8 = @"";
    dashboard.event_9 = @"";
    dashboard.event_10 = @"";
    dashboard.event_11 = @"";
    dashboard.event_12 = @"";
    dashboard.event_13 = @"";
    dashboard.event_14 = @"";
    dashboard.event_15 = @"";
    dashboard.event_16 = @"";
    dashboard.event_17 = @"";
    dashboard.event_18 = @"";
    dashboard.event_19 = @"";
    dashboard.event_20 = @"";
    dashboard.event_21 = @"";
    dashboard.event_22 = @"";
    dashboard.event_23 = @"";
    dashboard.occur_date = [Utility dateToString:[NSDate date]];
    
    Clipboard *clip = [Clipboard sharedClipboard];
    [clip clipValue:dashboard clipKey:@"create_discharge"];

}

- (IBAction)action_delete:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)action_send:(id)sender {
    if([_tf_siteID.text length] <= 0 || [_tf_healthcardNumber.text length] <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Fill out required field"
                                                       delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [alert show];
        return;
    }
    
    [self saveCurrentScreenData];
    
    // --- save everything
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    // An asynchronous Core Data save method provided by the StackMob iOS SDK.
    
    dashboard.status = @"Sent";
    [context saveOnSuccess:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    } onFailure:^(NSError *error) {
        NSLog(@"Error saving todo: %@", error);
        // --- Draft
    }];
}


//- (void)confirm:(id)sender {
//    if([_tf_siteID.text length] <= 0 || [_tf_healthcardNumber.text length] <= 0) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Fill out required field"
//                                                       delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//        
//        [alert show];
//        return;
//    }
//    
//    [self saveCurrentScreenData];
//
//    // --- save everything
//    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
//    // An asynchronous Core Data save method provided by the StackMob iOS SDK.
//    
//    dashboard.status = @"Sent";
//    [context saveOnSuccess:^{
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    } onFailure:^(NSError *error) {
//        NSLog(@"Error saving todo: %@", error);
//        // --- Draft
//    }];
//}

- (void)saveCurrentScreenData {
    dashboard.site_id = _tf_siteID.text;
    dashboard.healthcard_number = _tf_healthcardNumber.text;
    dashboard.admission_date = _lb_admission_date.text;
    dashboard.discharge_date = _lb_discharge_date.text;

    dashboard.patient_received_allogenic_blood = (_sw_patient_receivedallogenic_blood.isOn) ? @"YES" : @"NO";
    dashboard.patient_admitted_to_icu = (_sw_patient_admitted_to_icu.isOn) ? @"YES" : @"NO";
    dashboard.requires_step_down_bed = (_sw_requires_step_down_bed.isOn) ? @"YES" : @"NO";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    // Configure the cell...
    
    return cell;
}

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
    
    if(indexPath.section == 1) {
        if(indexPath.row == 1 ) {
            [datePickerViewController moveDownPickerView:self];
            [datePickerViewController moveUpPickerView];
            [_tf_siteID resignFirstResponder];
            [_tf_healthcardNumber resignFirstResponder];
            
            i_date_row = 1;
        }
        else if(indexPath.row == 2) {
            [datePickerViewController moveDownPickerView:self];
            [datePickerViewController moveUpPickerView];
            [_tf_siteID resignFirstResponder];
            [_tf_healthcardNumber resignFirstResponder];
            
            i_date_row = 2;
        }
    }
}



#pragma mark - NewDatePickerViewController delegate
-(void)delegateConfirm:(NSDate *)date_selected {
    if(i_date_row == 1) {
        _lb_admission_date.text = [Utility dateToString:date_selected];
    }
    else if(i_date_row == 2){
        _lb_discharge_date.text = [Utility dateToString:date_selected];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [datePickerViewController moveDownPickerView:self];
}

#pragma mark - custom moethod
- (IBAction)action_tf_siteID:(id)sender {
    [_tf_siteID resignFirstResponder];
    [_tf_healthcardNumber resignFirstResponder];
}
- (IBAction)action_healthcard:(id)sender {
    [_tf_siteID resignFirstResponder];
    [_tf_healthcardNumber resignFirstResponder];
}

@end
