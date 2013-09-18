//
//  IntakeForm5ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/31/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "IntakeForm5ViewController.h"
#import "Clipboard.h"
#import "NewDatePickerViewController.h"
#import "Utility.h"
#import "StackMob.h"
#import "DCRoundSwitch.h"
#import "KKDS_Preference.h"

@interface IntakeForm5ViewController ()

@end

@implementation IntakeForm5ViewController

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
    // Do any additional setup after loading the view from its nib.
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];
    
    storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardDidHideNotification object:nil];
    
    datePickerViewController = [[NewDatePickerViewController alloc] initWithNibName:@"NewDatePickerViewController" bundle:nil];
    datePickerView = [datePickerViewController getDatePickerView:self];
    [self.view addSubview:datePickerView];
    
    self.title = @"Intake Form";
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    /*
     - admit_to_hospital (BOOL)
     - follow_up_required (BOOL)
     - brace_required (BOOL)
     - surgery_required (BOOL)
     - date_of_surgery (BOOL)
     - surgical_billing_code (STRING)
     
     
     Admit to Hospital
     Follow-up Required
     Brace Required
     Surgery Required
     Date of surgery (If known)
     Surgical billing code(s)
     */
    
    //--- Menu Display ---//
    // 1 neurologically intact is always visible
    if([dashboard.admit_to_hospital isEqualToString:@"NO"]) {
        arr_menu = [NSMutableArray arrayWithObjects:@"Admit to Hospital", @"Follow-up Required", nil];
    }
    else {
        // admit to hospital == YES
        arr_menu = [NSMutableArray arrayWithObjects:@"Admit to Hospital", @"Brace Required", @"Surgery Required", nil];
        if([dashboard.surgery_required isEqualToString:@"YES"]) {
            [arr_menu addObject:@"Date of surgery (If known)"];
            [arr_menu addObject:@"Surgical billing code(s)"];
        }
    }
    
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Surgical billing code(s)"]) {
        return ((UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Surgical billing code(s)"]).frame.size.height;
    }
    else {
        return ((UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Normal Switch"]).frame.size.height;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == 0) {
        return [arr_menu count];
    }
    else {
        // submit or error
        return 1;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     Admit to Hospital
     Follow-up Required
     Brace Required
     Surgery Required
     Date of surgery (If known)
     Surgical billing code(s)
     
     */
    
    
    NSString *CellIdentifier = @"";
    UITableViewCell *cell = nil;
    
    
    switch (indexPath.section) {
        case 0:
            // menu
            if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Admit to Hospital"]) {
                CellIdentifier = @"Normal Switch";
                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
                lb_title.text = [arr_menu objectAtIndex:indexPath.row];
                
                DCRoundSwitch *dcsw_custom = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
                [dcsw_custom setOffText:@"NO"];
                [dcsw_custom setOnText:@"YES"];
                
                if([dashboard.admit_to_hospital isEqualToString:@"YES"]) [dcsw_custom setOn:YES animated:NO ignoreControlEvents:YES];
                else [dcsw_custom setOn:NO animated:NO ignoreControlEvents:YES];
                
                [cell addSubview:dcsw_custom];
                
                [dcsw_custom addTarget:self action:@selector(sel_admitToHospital:) forControlEvents:UIControlEventValueChanged];

                
//                CellIdentifier = @"Normal Switch";
//                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//                UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
//                lb_title.text = [arr_menu objectAtIndex:indexPath.row];
//                UISwitch *sw_menu = (UISwitch *)[cell viewWithTag:2];
//                if([dashboard.admit_to_hospital isEqualToString:@"NO"]) [sw_menu setOn:NO];
//                else [sw_menu setOn:YES];
//                
//                [sw_menu addTarget:self action:@selector(sel_switch:) forControlEvents:UIControlEventValueChanged];
            }
            else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Follow-up Required"]) {
                CellIdentifier = @"Normal Switch";
                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
                lb_title.text = [arr_menu objectAtIndex:indexPath.row];

                DCRoundSwitch *dcsw_custom = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
                [dcsw_custom setOffText:@"NO"];
                [dcsw_custom setOnText:@"YES"];
                
                if([dashboard.follow_up_required isEqualToString:@"YES"]) [dcsw_custom setOn:YES animated:NO ignoreControlEvents:YES];
                else [dcsw_custom setOn:NO animated:NO ignoreControlEvents:YES];
                
                [cell addSubview:dcsw_custom];
                
                [dcsw_custom addTarget:self action:@selector(sel_admitToHospital:) forControlEvents:UIControlEventValueChanged];
//                CellIdentifier = @"Normal Switch";
//                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//                UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
//                lb_title.text = [arr_menu objectAtIndex:indexPath.row];
//                UISwitch *sw_menu = (UISwitch *)[cell viewWithTag:2];
//                if([dashboard.follow_up_required isEqualToString:@"NO"]) [sw_menu setOn:NO];
//                else [sw_menu setOn:YES];
//                
//                [sw_menu addTarget:self action:@selector(sel_switch:) forControlEvents:UIControlEventValueChanged];
            }
            else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Brace Required"]) {
                CellIdentifier = @"Normal Switch";
                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
                lb_title.text = [arr_menu objectAtIndex:indexPath.row];
                
                DCRoundSwitch *dcsw_custom = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
                [dcsw_custom setOffText:@"NO"];
                [dcsw_custom setOnText:@"YES"];
                
                if([dashboard.brace_required isEqualToString:@"YES"]) [dcsw_custom setOn:YES animated:NO ignoreControlEvents:YES];
                else [dcsw_custom setOn:NO animated:NO ignoreControlEvents:YES];
                
                [cell addSubview:dcsw_custom];
                
                [dcsw_custom addTarget:self action:@selector(sel_admitToHospital:) forControlEvents:UIControlEventValueChanged];

//                CellIdentifier = @"Normal Switch";
//                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//                UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
//                lb_title.text = [arr_menu objectAtIndex:indexPath.row];
//                UISwitch *sw_menu = (UISwitch *)[cell viewWithTag:2];
//                if([dashboard.brace_required isEqualToString:@"NO"]) [sw_menu setOn:NO];
//                else [sw_menu setOn:YES];
//                
//                [sw_menu addTarget:self action:@selector(sel_switch:) forControlEvents:UIControlEventValueChanged];
            }
            else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Surgery Required"]) {
                CellIdentifier = @"Normal Switch";
                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
                lb_title.text = [arr_menu objectAtIndex:indexPath.row];
                
                DCRoundSwitch *dcsw_custom = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
                [dcsw_custom setOffText:@"NO"];
                [dcsw_custom setOnText:@"YES"];
                
                if([dashboard.surgery_required isEqualToString:@"YES"]) [dcsw_custom setOn:YES animated:NO ignoreControlEvents:YES];
                else [dcsw_custom setOn:NO animated:NO ignoreControlEvents:YES];
                
                [cell addSubview:dcsw_custom];
                
                [dcsw_custom addTarget:self action:@selector(sel_admitToHospital:) forControlEvents:UIControlEventValueChanged];
//                CellIdentifier = @"Normal Switch";
//                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//                UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
//                lb_title.text = [arr_menu objectAtIndex:indexPath.row];
//                UISwitch *sw_menu = (UISwitch *)[cell viewWithTag:2];
//                if([dashboard.surgery_required isEqualToString:@"NO"]) [sw_menu setOn:NO];
//                else [sw_menu setOn:YES];
//                
//                [sw_menu addTarget:self action:@selector(sel_switch:) forControlEvents:UIControlEventValueChanged];
            }
            else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Date of surgery (If known)"]) {
                CellIdentifier = @"Date of surgery (If known)";
                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                
                _lb_dateOfSurgery = (UILabel *)[cell viewWithTag:2];
            }
            else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Surgical billing code(s)"]) {
                CellIdentifier = @"Surgical billing code(s)";
                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            }
            break;
        case 1:
            // submit
            CellIdentifier = @"Submit";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        default:
            break;
    }
    
    // Configure the cell...
    
    return cell;
}

- (void)sel_admitToHospital:(id)sender {
    DCRoundSwitch *dcsw_tmp = (DCRoundSwitch *)sender;
    CGRect buttonFrame = [dcsw_tmp convertRect:dcsw_tmp.bounds toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonFrame.origin];
    
    if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Admit to Hospital"]) {
        if(dcsw_tmp.isOn) dashboard.admit_to_hospital = @"YES";
        else dashboard.admit_to_hospital= @"NO";
    }
    else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Follow-up Required"]) {
        if(dcsw_tmp.isOn) dashboard.follow_up_required = @"YES";
        else dashboard.follow_up_required= @"NO";
    }
    else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Brace Required"]) {
        if(dcsw_tmp.isOn) dashboard.brace_required = @"YES";
        else dashboard.brace_required = @"NO";
    }
    else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Surgery Required"]) {
        if(dcsw_tmp.isOn) dashboard.surgery_required = @"YES";
        else dashboard.surgery_required = @"NO";
    }

    
    [self viewWillAppear:NO];

}

//- (void)sel_switch:(id)sender {
//    UISwitch *button = (UISwitch *)sender;
//    CGRect buttonFrame = [button convertRect:button.bounds toView:self.tableView];
//    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonFrame.origin];
//    
////    if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Admit to Hospital"]) {
////        if(button.isOn) dashboard.admit_to_hospital = @"YES";
////        else dashboard.admit_to_hospital = @"NO";
////    }
//    if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Follow-up Required"]) {
//        if(button.isOn) dashboard.follow_up_required = @"YES";
//        else dashboard.follow_up_required= @"NO";
//    }
//    else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Brace Required"]) {
//        if(button.isOn) dashboard.brace_required = @"YES";
//        else dashboard.brace_required = @"NO";
//    }
//    else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Surgery Required"]) {
//        if(button.isOn) dashboard.surgery_required = @"YES";
//        else dashboard.surgery_required = @"NO";
//    }
//    
//    [self viewWillAppear:NO];
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
    
    if(indexPath.section == 0) {
        if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Date of surgery (If known)"]) {
            [datePickerViewController moveUpPickerView];
        }
        else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Date of surgery (If known)"]) {
            [datePickerViewController moveUpPickerView];
        }
        else if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Date of surgery (If known)"]) {
            [datePickerViewController moveUpPickerView];
        }
    }
    else {
        // submit
        [self saveCurrentScreenData];
        // --- save everything
        dashboard.status = @"Sent";
        NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
        // An asynchronous Core Data save method provided by the StackMob iOS SDK.

        [context saveOnSuccess:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } onFailure:^(NSError *error) {
            NSLog(@"Error saving todo: %@", error);
            // --- Draft
        }];        
        
        
    }
}

#pragma mark - keyboard
-(void) keyboardShown:(NSNotification*) notification {
    _initialTVHeight = self.tableView.frame.size.height;
    
    CGRect initialFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect convertedFrame = [self.view convertRect:initialFrame fromView:nil];
    CGRect tvFrame = self.tableView.frame;
    tvFrame.size.height = convertedFrame.origin.y;
    self.tableView.frame = tvFrame;
}

-(void) keyboardHidden:(NSNotification*) notification {
    CGRect tvFrame = self.tableView.frame;
    tvFrame.size.height = _initialTVHeight;
    [UIView beginAnimations:@"TableViewDown" context:NULL];
    [UIView setAnimationDuration:0.5f];
    self.tableView.frame = tvFrame;
    [UIView commitAnimations];
}

-(void) scrollToCell:(NSIndexPath*) path {
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
    
    CGRect buttonFrame = [textField convertRect:textField.bounds toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonFrame.origin];
    
    [self performSelector:@selector(scrollToCell:) withObject:indexPath afterDelay:0.5f];
}

- (IBAction)billing_code_done:(id)sender {
    UITextField *tf_tmp = (UITextField *)sender;
    dashboard.surgical_billing_code = tf_tmp.text;
}

#pragma mark - NewDatePickerViewController delegate
-(void)delegateConfirm:(NSDate *)date_selected {
    _lb_dateOfSurgery.text = [Utility dateToString:date_selected];
}

#pragma mark - custom method

- (void)saveCurrentScreenData {
    dashboard.date_of_surgery = _lb_dateOfSurgery.text;
    
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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"The data will be removed \nfrom the database."
                                                   delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.delegate = self;
    [alert show];
    
}

@end
