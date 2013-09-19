//
//  Surgery1ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/7/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "Surgery1ViewController.h"


@interface Surgery1ViewController ()

@end

@implementation Surgery1ViewController
@synthesize dashboard;

- (id)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
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
    
    if(self.dashboard == nil) {
        [self initSurgeryData];
    }
    
    Clipboard *clip = [Clipboard sharedClipboard];
    [clip clipValue:dashboard clipKey:@"create_surgery"];
}

-(void)cancelNumberPad:(id)sender{
    [tf_estimatedBloodLoss resignFirstResponder];
    [tf_timeCompression resignFirstResponder];
}

-(void)doneWithNumberPad:(id)sender{
    
    [tf_estimatedBloodLoss resignFirstResponder];
    [tf_timeCompression resignFirstResponder];
}

- (void)initSurgeryData {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
//    str_asoScore = @"";
    
    dashboard = [NSEntityDescription insertNewObjectForEntityForName:@"Dashboard" inManagedObjectContext:context];
    dashboard.occur_date = [Utility dateToString:[NSDate date]];
    dashboard.dashboard_id = [dashboard assignObjectId];
    dashboard.patient_status = @"Surgery";
    dashboard.patient_with_sci = @"NO";
    dashboard.intra_operative_adverse_events = @"NO";
    dashboard.vertebral_surgery = @"NO";
    dashboard.adjunctive_procedures = @"NO";
    dashboard.other_surgery = @"NO";
    dashboard.aso_score = @"";
    
    // intra
    dashboard.intra_0 = @"";
    dashboard.intra_1 = @"";
    dashboard.intra_2 = @"";
    dashboard.intra_3 = @"";
    dashboard.intra_4 = @"";
    dashboard.intra_5 = @"";
    dashboard.intra_6 = @"";
    dashboard.intra_7 = @"";
    dashboard.intra_8 = @"";
    dashboard.intra_9 = @"";
    dashboard.intra_10 = @"";
    dashboard.intra_11 = @"";
    dashboard.intra_12 = @"";
    dashboard.intra_13 = @"";
    dashboard.intra_14 = @"";
    dashboard.intra_15 = @"";
    
    dashboard.intra_bool_0 = @"NO";
    dashboard.intra_bool_1 = @"NO";
    dashboard.intra_bool_2 = @"NO";
    dashboard.intra_bool_3 = @"NO";
    dashboard.intra_bool_4 = @"NO";
    dashboard.intra_bool_5 = @"NO";
    dashboard.intra_bool_6 = @"NO";
    dashboard.intra_bool_7 = @"NO";
    dashboard.intra_bool_8 = @"NO";
    dashboard.intra_bool_9 = @"NO";
    dashboard.intra_bool_10 = @"NO";
    dashboard.intra_bool_11 = @"NO";
    dashboard.intra_bool_12 = @"NO";
    dashboard.intra_bool_13 = @"NO";
    dashboard.intra_bool_14 = @"NO";
    dashboard.intra_bool_15 = @"NO";
    
    dashboard.flxation_non = @"0";
    dashboard.flxation_plate = @"0";
    dashboard.flxation_rod = @"0";
    dashboard.flxation_arth = @"0";
    dashboard.flxation_interspinous = @"0";
    dashboard.flxation_cannulated = @"0";
    dashboard.flxation_synthetic = @"0";
    dashboard.flxation_interbody = @"0";
    dashboard.flxation_other = @"0";
    
    dashboard.flxation_bone_graft_bool = @"000000000000";
    
    dashboard.adj_monitoring = @"NO";
    dashboard.adj_monitoring_non = @"NO";
    dashboard.adj_monitoring_emg = @"NO";
    dashboard.adj_monitoring_motor = @"NO";
    dashboard.adj_monitoring_sensory = @"NO";
    
    dashboard.adj_imaging = @"NO";
    dashboard.adj_imaging_none = @"NO";
    dashboard.adj_imaging_x_ray = @"NO";
    dashboard.adj_imaging_fluroscopy = @"NO";
    dashboard.adj_imaging_ct_3d = @"NO";
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
//    NSLog(@"### Date Log : %@", self.dt_start.description);
    
//    dashboard.aso_score = str_asoScore;
    
    arr_menu0 = [[NSMutableArray alloc] init];
    arr_menu1 = [[NSMutableArray alloc] init];
    
    [arr_menu0 addObject:@"Site ID"];
    [arr_menu0 addObject:@"ASO Score"];
    [arr_menu0 addObject:@"Healthcard Number"];
    [arr_menu0 addObject:@"Start/Time Date of Surgery"];
    [arr_menu0 addObject:@"End /Time Date of Surgery"];
    [arr_menu0 addObject:@"Estimated Blood Loss"];
    [arr_menu0 addObject:@"Patient with SCI"];
    if([dashboard.patient_with_sci isEqualToString:@"YES"]) {
        [arr_menu0 addObject:@"Time from spinal cord injury to direct or indirect compression"];
    }
    [arr_menu1 addObject:@"1. Intra-operative adverse events"];
    [arr_menu1 addObject:@"2. Vertebral surgery"];
    [arr_menu1 addObject:@"3. Adjunctive procedures"];
    [arr_menu1 addObject:@"4. Other surgery"];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ModalPickerViewController
-(void)didFinishedModalPickerConfirmed:(NSMutableArray *)arr_selectedItems tag:(id)tag {
    //            [arr_menu0 addObject:@"Start/Time Date of Surgery"];
    //            [arr_menu0 addObject:@"End /Time Date of Surgery"];

    if([tag isEqualToString:@"ASO Score"]) {
        dashboard.aso_score = [arr_selectedItems objectAtIndex:0];
    }
    else if([tag isEqualToString:@"Start/Time Date of Surgery"]) {
        dashboard.start_time_date_of_surgery = [Utility dateTimeToStringWithFormatHHmm:[arr_selectedItems objectAtIndex:0]];

    }
    else if([tag isEqualToString:@"End /Time Date of Surgery"]) {
        dashboard.end_time_date_of_surgery = [Utility dateTimeToStringWithFormatHHmm:[arr_selectedItems objectAtIndex:0]];
    }
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == 0) {
        return [arr_menu0 count];
    }
    else if(section == 1) {
        return [arr_menu1 count];
    }
    else if(section == 2) {
        return 1;
    }
    else {
        // error
        return 0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
    // Configure the cell...
    /*
     [arr_menu0 addObject:@"Site ID"];
     [arr_menu0 addObject:@"ASO Score"];
     [arr_menu0 addObject:@"Healthcard Number"];
     [arr_menu0 addObject:@"Start/Time Date of Surgery"];
     [arr_menu0 addObject:@"End /Time Date of Surgery"];
     [arr_menu0 addObject:@"Estimated Blood Loss"];
     [arr_menu0 addObject:@"Patient with SCI"];
     if([dashboard.patient_with_sci isEqualToString:@"YES"]) {
     [arr_menu0 addObject:@"Time from spinal cord injury to direct or indirect compression"];
     }
     [arr_menu1 addObject:@"1. Intra-operative adverse events"];
     [arr_menu1 addObject:@"2. Vertebral surgery"];
     [arr_menu1 addObject:@"3. Adjunctive procedures"];
     [arr_menu1 addObject:@"4. Other surgery"];
     */

    UITableViewCell *cell = nil;
    int i_curRow = indexPath.row;
    
    if(indexPath.section == 0) {
        if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Site ID"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell0"];
            tf_siteId = (UITextField *)[cell viewWithTag:3];
            tf_siteId.text = dashboard.site_id;
            tf_siteId.delegate = self;
            [tf_siteId addTarget:self action:@selector(didFinishTextEdit:) forControlEvents:UIControlEventEditingDidEndOnExit];
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"ASO Score"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
            UILabel *lb_asoScore = (UILabel *)[cell viewWithTag:3];
            lb_asoScore.text = dashboard.aso_score;
            
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Healthcard Number"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
            tf_healthcard = (UITextField *)[cell viewWithTag:3];
            tf_healthcard.text = dashboard.healthcard_number;
            tf_healthcard.delegate = self;
            [tf_healthcard addTarget:self action:@selector(didFinishTextEdit:) forControlEvents:UIControlEventEditingDidEndOnExit];
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Start/Time Date of Surgery"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3"];
            lb_startTime = (UILabel *)[cell viewWithTag:3];
            lb_startTime.text = dashboard.start_time_date_of_surgery;
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"End /Time Date of Surgery"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell4"];
            lb_endTime = (UILabel *)[cell viewWithTag:3];
            lb_endTime.text = dashboard.end_time_date_of_surgery;
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Estimated Blood Loss"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell5"];
            tf_estimatedBloodLoss = (UITextField *)[cell viewWithTag:3];
            tf_estimatedBloodLoss.delegate = self;
            tf_estimatedBloodLoss.text = dashboard.estimated_blood_loss;

            UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
            numberToolbar.barStyle = UIBarStyleBlackTranslucent;
            numberToolbar.items = [NSArray arrayWithObjects:
                                   [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                   [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(didFinishTextEdit:)],
                                   nil];
            [numberToolbar sizeToFit];
            tf_estimatedBloodLoss.inputAccessoryView = numberToolbar;
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Patient with SCI"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell6"];
            DCRoundSwitch *dcsw_custom = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom setOffText:@"NO"];
            [dcsw_custom setOnText:@"YES"];
            [dcsw_custom setOn:([dashboard.patient_with_sci isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom];
            [dcsw_custom addTarget:self action:@selector(selPatientWithSci:) forControlEvents:UIControlEventValueChanged];
            
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Time from spinal cord injury to direct or indirect compression"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell7"];
            tf_timeCompression = (UITextField *)[cell viewWithTag:3];
            tf_timeCompression.delegate = self;
            tf_timeCompression.text = dashboard.time_from_spinal_cord_injury;

            UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
            numberToolbar.barStyle = UIBarStyleBlackTranslucent;
            numberToolbar.items = [NSArray arrayWithObjects:
                                   [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                   [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(didFinishTextEdit:)],
                                   nil];
            [numberToolbar sizeToFit];
            tf_timeCompression.inputAccessoryView = numberToolbar;
        }

    }
    else if(indexPath.section == 1) {
        if([[arr_menu1 objectAtIndex:i_curRow] isEqualToString:@"1. Intra-operative adverse events"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection2"];
            btn_section2_0 = (UIButton *)[cell viewWithTag:2];
            if ([dashboard.intra_operative_adverse_events isEqualToString:@"NO"]) {
//                [btn_section2_0 setTitle:@"  " forState:UIControlStateNormal];
                [btn_section2_0 setBackgroundImage:[UIImage imageNamed:@"checkbox_off"] forState:UIControlStateNormal];
            }
            else {
//                [btn_section2_0 setTitle:@"X" forState:UIControlStateNormal];
                [btn_section2_0 setBackgroundImage:[UIImage imageNamed:@"checkbox_on"] forState:UIControlStateNormal];

            }
            
            [btn_section2_0 addTarget:self action:@selector(action_btn_0:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([[arr_menu1 objectAtIndex:i_curRow] isEqualToString:@"2. Vertebral surgery"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection2"];
            btn_section2_1 = (UIButton *)[cell viewWithTag:2];
            if ([dashboard.vertebral_surgery isEqualToString:@"NO"]) {
                [btn_section2_1 setBackgroundImage:[UIImage imageNamed:@"checkbox_off"] forState:UIControlStateNormal];
            }
            else {
                [btn_section2_1 setBackgroundImage:[UIImage imageNamed:@"checkbox_on"] forState:UIControlStateNormal];
            }
            
            [btn_section2_1 addTarget:self action:@selector(action_btn_1:) forControlEvents:UIControlEventTouchUpInside];

            
        }
        else if([[arr_menu1 objectAtIndex:i_curRow] isEqualToString:@"3. Adjunctive procedures"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection2"];
            btn_section2_2 = (UIButton *)[cell viewWithTag:2];
            if ([dashboard.adjunctive_procedures isEqualToString:@"NO"]) {
                [btn_section2_2 setBackgroundImage:[UIImage imageNamed:@"checkbox_off"] forState:UIControlStateNormal];
            }
            else {
                [btn_section2_2 setBackgroundImage:[UIImage imageNamed:@"checkbox_on"] forState:UIControlStateNormal];
            }
            
            [btn_section2_2 addTarget:self action:@selector(action_btn_2:) forControlEvents:UIControlEventTouchUpInside];

        }
        else if([[arr_menu1 objectAtIndex:i_curRow] isEqualToString:@"4. Other surgery"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection2"];
            btn_section2_3 = (UIButton *)[cell viewWithTag:2];
            if ([dashboard.other_surgery isEqualToString:@"NO"]) {
                [btn_section2_3 setBackgroundImage:[UIImage imageNamed:@"checkbox_off"] forState:UIControlStateNormal];
            }
            else {
                [btn_section2_3 setBackgroundImage:[UIImage imageNamed:@"checkbox_on"] forState:UIControlStateNormal];
            }
            
            [btn_section2_3 addTarget:self action:@selector(action_btn_3:) forControlEvents:UIControlEventTouchUpInside];
        }

        // set label
        [(UILabel *)[cell viewWithTag:1] setText:[arr_menu1 objectAtIndex:i_curRow]];
    }
    else if(indexPath.section == 2) {
        // submit
        cell = [tableView dequeueReusableCellWithIdentifier:@"Submit"];
    }
    else {
        // error
    }
    
    return cell;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    self.tableView.userInteractionEnabled = NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self saveCurScreenData];
}


- (void)didFinishTextEdit:(id)sender {
//    self.view.userInteractionEnabled = YES;
    [tf_estimatedBloodLoss resignFirstResponder];
    [tf_timeCompression resignFirstResponder];
    [tf_healthcard resignFirstResponder];
    [tf_siteId resignFirstResponder];
}

#pragma mark - selector method

- (void)selPatientWithSci:(id)sender {
    dashboard.patient_with_sci = ([sender isOn] ? @"YES" : @"NO");
    [self viewWillAppear:NO];
}

- (void)action_btn_0:(id)sender {
    if([dashboard.intra_operative_adverse_events isEqualToString:@"NO"]) {
        dashboard.intra_operative_adverse_events = @"YES";
    }
    else {
        dashboard.intra_operative_adverse_events = @"NO";
    }
    [self.tableView reloadData];
    
}
- (void)action_btn_1:(id)sender {
    if([dashboard.vertebral_surgery isEqualToString:@"NO"]) {
        dashboard.vertebral_surgery = @"YES";
    }
    else {
        dashboard.vertebral_surgery = @"NO";
    }
    [self.tableView reloadData];
}
- (void)action_btn_2:(id)sender {
    if([dashboard.adjunctive_procedures isEqualToString:@"NO"]) {
        dashboard.adjunctive_procedures = @"YES";
    }
    else {
        dashboard.adjunctive_procedures = @"NO";
    }
    [self.tableView reloadData];
}
- (void)action_btn_3:(id)sender {
    if([dashboard.other_surgery isEqualToString:@"NO"]) {
        dashboard.other_surgery = @"YES";
    }
    else {
        dashboard.other_surgery = @"NO";
    }
    [self.tableView reloadData];
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
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    if(indexPath.section == 0) {
        if(indexPath.row == 1) {
            //ASO Score
            self.navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
            
            ModalPickerViewController *modalController = [[ModalPickerViewController alloc] initWithNibName:@"ModalPickerViewController" bundle:nil];
            modalController.delegate = self;
            NSMutableArray *arr_sources = [[NSMutableArray alloc] init];
            [arr_sources addObject:[NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil]];
            modalController.arr_sources = arr_sources;
            modalController.tag = @"ASO Score";
            [modalController setToolbarTitle:@"ASO Score"];
            [self presentViewController:modalController animated:YES completion:nil];

        }
        else if(indexPath.row == 3) {
            // start time
            ModalPickerViewController *modalController = [[ModalPickerViewController alloc] initWithNibName:@"ModalPickerViewController" bundle:nil];
            modalController.delegate = self;
            modalController.modalMode = ModalPickerViewModeDatePicker;
            [modalController setToolbarTitle:@"Start/Time Date of Surgery"];
            modalController.tag = @"Start/Time Date of Surgery";
            [self presentViewController:modalController animated:YES completion:nil];
        }
        else if(indexPath.row == 4) {
            // end time
            ModalPickerViewController *modalController = [[ModalPickerViewController alloc] initWithNibName:@"ModalPickerViewController" bundle:nil];
            modalController.delegate = self;
            modalController.modalMode = ModalPickerViewModeDatePicker;
            [modalController setToolbarTitle:@"End /Time Date of Surgery"];
            modalController.tag = @"End /Time Date of Surgery";
            [self presentViewController:modalController animated:YES completion:nil];
        }
        else {

        }
    }
    else if(indexPath.section == 1) {
        if(indexPath.row == 0) {
            if([dashboard.intra_operative_adverse_events isEqualToString:@"YES"]) {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
                AdverseEventViewController *adverseController = [storyboard instantiateViewControllerWithIdentifier:@"AdverseEventViewController"];
                adverseController.title = [arr_menu1 objectAtIndex:indexPath.row];
                adverseController.dashboard = dashboard;
                [self.navigationController pushViewController:adverseController animated:YES];
            }
        }
        else if(indexPath.row == 1) {
            if([dashboard.vertebral_surgery isEqualToString:@"YES"]) {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
                VertebralSurgeryViewController *vertebralController = [storyboard instantiateViewControllerWithIdentifier:@"VertebralSurgeryViewController"];
                vertebralController.title  = [arr_menu1 objectAtIndex:indexPath.row];
                [self.navigationController pushViewController:vertebralController animated:YES];

            }
        }
        else if(indexPath.row == 2) {
            if([dashboard.adjunctive_procedures isEqualToString:@"YES"]) {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
                AdjunctiveViewController *adjController = [storyboard instantiateViewControllerWithIdentifier:@"AdjunctiveViewController"];
                adjController.title = [arr_menu1 objectAtIndex:indexPath.row];
                [self.navigationController pushViewController:adjController animated:YES];

            }
        }
        else if(indexPath.row == 3) {
            if([dashboard.other_surgery isEqualToString:@"YES"]) {
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
                OtherSurgeryViewController *otherController = [storyboard instantiateViewControllerWithIdentifier:@"OtherSurgeryViewController"];
                otherController.title = [arr_menu1 objectAtIndex:indexPath.row];
                [self.navigationController pushViewController:otherController animated:YES];
            }
        }
    }
    else if(indexPath.section == 2) {
        // submit
        if([tf_siteId.text length] <= 0 || [tf_healthcard.text length] <= 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Fill out required field"
                                                           delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            
            [alert show];
            return;
        }
            
        // --- save everything
        [self saveCurScreenData];
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
    else {
        // error
    }
}

- (void)saveCurScreenData {
    dashboard.start_time_date_of_surgery = lb_startTime.text;
    dashboard.end_time_date_of_surgery = lb_endTime.text;
    dashboard.site_id = tf_siteId.text;
    dashboard.healthcard_number = tf_healthcard.text;
    dashboard.estimated_blood_loss = tf_estimatedBloodLoss.text;
    dashboard.time_from_spinal_cord_injury = tf_timeCompression.text;
    
//    dashboard.intra_operative_adverse_events = btn_section2_0.titleLabel.text;
//    dashboard.vertebral_surgery = btn_section2_1.titleLabel.text;
//    dashboard.adjunctive_procedures = btn_section2_2.titleLabel.text;
//    dashboard.other_surgery = btn_section2_3.titleLabel.text;
}

- (IBAction)save_local:(id)sender {
    if([tf_siteId.text length] <= 0 || [tf_healthcard.text length] <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Fill out required field"
                                                       delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [alert show];
        return;
    }
    
    [self saveCurScreenData];
    
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
