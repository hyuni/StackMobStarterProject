//
//  Discharge3ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/1/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "Discharge3ViewController.h"
#import "OnePickerViewController.h"
#import "Clipboard.h"
#import "DCRoundSwitch.h"
#import "KKDS_Preference.h"

@interface Discharge3ViewController ()

@end

@implementation Discharge3ViewController

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
    
    self.title = @"Adverse Event";
    flag_first = YES;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    Clipboard *clipboard = [Clipboard sharedClipboard];
    dashboard = [clipboard clipKey:@"create_discharge"];
    
    UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)];
    self.navigationItem.rightBarButtonItem = confirmButton;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardDidHideNotification object:nil];
    
    _tv_other.text = dashboard.event_23;

}

-(void) keyboardShown:(NSNotification*) notification {
    _initialTVHeight = self.tableView.frame.size.height;
    
    CGRect tmpRect = self.tableView.frame;
    tmpRect.size.height -= 170;
    self.tableView.frame = tmpRect;
    
//    CGRect initialFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    CGRect convertedFrame = [self.view convertRect:initialFrame fromView:nil];
//    CGRect tvFrame = self.tableView.frame;
//    
//    int a = tvFrame.size.height;
//    
//    tvFrame.size.height = convertedFrame.origin.y;
//    self.tableView.frame = tvFrame;
}

-(void) keyboardHidden:(NSNotification*) notification {
    
    if(flag_first == YES) {
        flag_first = NO;
        return;
    }
    
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

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    CGRect buttonFrame = [textView convertRect:textView.bounds toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonFrame.origin];
    
    [self performSelector:@selector(scrollToCell:) withObject:indexPath afterDelay:0.5f];
    return YES;
}

- (void)confirm:(id)sender {
    dashboard.event_23 = _tv_other.text;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [super tableView:tableView numberOfRowsInSection:section];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
            lb_title.text = dashboard.event_days;
        }
    }
    else if(indexPath.section == 1){
        UIButton *btn_grade = (UIButton *)[cell viewWithTag:2];
        
        NSArray *arr_event = [NSArray arrayWithObjects:dashboard.event_0, dashboard.event_1, dashboard.event_2, dashboard.event_3, dashboard.event_4, dashboard.event_5, dashboard.event_6, dashboard.event_7, dashboard.event_8, dashboard.event_9, dashboard.event_10, dashboard.event_11, dashboard.event_12, dashboard.event_13, dashboard.event_14, dashboard.event_15, dashboard.event_16, dashboard.event_17, dashboard.event_18, dashboard.event_19, dashboard.event_20, dashboard.event_21, dashboard.event_22, dashboard.event_23, nil];
        
        [btn_grade setTitle:(NSString *)[arr_event objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        
        [btn_grade addTarget:self action:@selector(btn_pressed:) forControlEvents:UIControlEventTouchUpInside];

        if(indexPath.row == 12) {
            DCRoundSwitch *dcsw_custom0 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y0, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom0 setOffText:@"NO"];
            [dcsw_custom0 setOnText:@"YES"];
            [dcsw_custom0 setOn:([dashboard.event_16_0 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom0];
            [dcsw_custom0 addTarget:self action:@selector(action_sw_infaction0:) forControlEvents:UIControlEventValueChanged];
            
            DCRoundSwitch *dcsw_custom1 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y1, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom1 setOffText:@"NO"];
            [dcsw_custom1 setOnText:@"YES"];
            [dcsw_custom1 setOn:([dashboard.event_16_1 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom1];
            [dcsw_custom1 addTarget:self action:@selector(action_sw_infaction1:) forControlEvents:UIControlEventValueChanged];
            
            DCRoundSwitch *dcsw_custom2 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y2, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom2 setOffText:@"NO"];
            [dcsw_custom2 setOnText:@"YES"];
            [dcsw_custom2 setOn:([dashboard.event_16_2 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom2];
            [dcsw_custom2 addTarget:self action:@selector(action_sw_infaction2:) forControlEvents:UIControlEventValueChanged];

            DCRoundSwitch *dcsw_custom3 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y3, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom3 setOffText:@"NO"];
            [dcsw_custom3 setOnText:@"YES"];
            [dcsw_custom3 setOn:([dashboard.event_16_3 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom3];
            [dcsw_custom3 addTarget:self action:@selector(action_sw_infaction3:) forControlEvents:UIControlEventValueChanged];


            
            
//            UISwitch *sw_0 = (UISwitch *)[cell viewWithTag:3];
//            UISwitch *sw_1 = (UISwitch *)[cell viewWithTag:4];
//            UISwitch *sw_2 = (UISwitch *)[cell viewWithTag:5];
//            UISwitch *sw_3 = (UISwitch *)[cell viewWithTag:6];
//            [sw_0 setOn:([dashboard.event_16_0 isEqualToString:@"YES"]) ? YES : NO];
//            [sw_1 setOn:([dashboard.event_16_1 isEqualToString:@"YES"]) ? YES : NO];
//            [sw_2 setOn:([dashboard.event_16_2 isEqualToString:@"YES"]) ? YES : NO];
//            [sw_3 setOn:([dashboard.event_16_3 isEqualToString:@"YES"]) ? YES : NO];
            
        }
        else if(indexPath.row == 15) {
            DCRoundSwitch *dcsw_custom0 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y0, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom0 setOffText:@"NO"];
            [dcsw_custom0 setOnText:@"YES"];
            [dcsw_custom0 setOn:([dashboard.event_19_0 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom0];
            [dcsw_custom0 addTarget:self action:@selector(action_neurol_deterioration0:) forControlEvents:UIControlEventValueChanged];
            
            DCRoundSwitch *dcsw_custom1 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y1, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom1 setOffText:@"NO"];
            [dcsw_custom1 setOnText:@"YES"];
            [dcsw_custom1 setOn:([dashboard.event_19_1 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom1];
            [dcsw_custom1 addTarget:self action:@selector(action_neurol_deterioration1:) forControlEvents:UIControlEventValueChanged];
            
            DCRoundSwitch *dcsw_custom2 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y2, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom2 setOffText:@"NO"];
            [dcsw_custom2 setOnText:@"YES"];
            [dcsw_custom2 setOn:([dashboard.event_19_2 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom2];
            [dcsw_custom2 addTarget:self action:@selector(action_neurol_deterioration2:) forControlEvents:UIControlEventValueChanged];

            
            
            
//            UISwitch *sw_0 = (UISwitch *)[cell viewWithTag:3];
//            UISwitch *sw_1 = (UISwitch *)[cell viewWithTag:4];
//            UISwitch *sw_2 = (UISwitch *)[cell viewWithTag:5];
//            [sw_0 setOn:([dashboard.event_19_0 isEqualToString:@"YES"]) ? YES : NO];
//            [sw_1 setOn:([dashboard.event_19_1 isEqualToString:@"YES"]) ? YES : NO];
//            [sw_2 setOn:([dashboard.event_19_2 isEqualToString:@"YES"]) ? YES : NO];

            
        }
        else if(indexPath.row == 19) {
            DCRoundSwitch *dcsw_custom0 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y0, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom0 setOffText:@"NO"];
            [dcsw_custom0 setOnText:@"YES"];
            [dcsw_custom0 setOn:([dashboard.event_22_0 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom0];
            [dcsw_custom0 addTarget:self action:@selector(throm_0:) forControlEvents:UIControlEventValueChanged];
            
            DCRoundSwitch *dcsw_custom1 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y1, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom1 setOffText:@"NO"];
            [dcsw_custom1 setOnText:@"YES"];
            [dcsw_custom1 setOn:([dashboard.event_22_1 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom1];
            [dcsw_custom1 addTarget:self action:@selector(throm_1:) forControlEvents:UIControlEventValueChanged];
            
//            UISwitch *sw_0 = (UISwitch *)[cell viewWithTag:3];
//            UISwitch *sw_1 = (UISwitch *)[cell viewWithTag:4];
//            [sw_0 setOn:([dashboard.event_22_0 isEqualToString:@"YES"]) ? YES : NO];
//            [sw_1 setOn:([dashboard.event_22_1 isEqualToString:@"YES"]) ? YES : NO];


            
        }
        else if(indexPath.row == 22) {
            DCRoundSwitch *dcsw_custom0 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y0, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom0 setOffText:@"NO"];
            [dcsw_custom0 setOnText:@"YES"];
            [dcsw_custom0 setOn:([dashboard.event_23_0 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom0];
            [dcsw_custom0 addTarget:self action:@selector(wound_0:) forControlEvents:UIControlEventValueChanged];
            
            DCRoundSwitch *dcsw_custom1 = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Discharge3_Origin_X, DCSwitch_Discharge3_Origin_Y1, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [dcsw_custom1 setOffText:@"NO"];
            [dcsw_custom1 setOnText:@"YES"];
            [dcsw_custom1 setOn:([dashboard.event_23_1 isEqualToString:@"YES"]) ? YES : NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:dcsw_custom1];
            [dcsw_custom1 addTarget:self action:@selector(wound_1:) forControlEvents:UIControlEventValueChanged];
            
//            UISwitch *sw_0 = (UISwitch *)[cell viewWithTag:3];
//            UISwitch *sw_1 = (UISwitch *)[cell viewWithTag:4];
//            [sw_0 setOn:([dashboard.event_23_0 isEqualToString:@"YES"]) ? YES : NO];
//            [sw_1 setOn:([dashboard.event_23_1 isEqualToString:@"YES"]) ? YES : NO];

            
        }
        else if(indexPath.row == 23) {
            UITextField *tf_other = (UITextField *)[cell viewWithTag:100];
            tf_other.text = dashboard.event_23;
        }
        
        
    }
    else {
        
    }
    
    return cell;
}

- (void)btn_pressed:(id)sender {

    CGRect buttonFrame = [(UIButton *)sender convertRect:((UIButton *)sender).bounds toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonFrame.origin];

    OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
    
    oneController.title = @"Peri-operative Adverse Events";
    NSMutableArray *arr_tmp = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil];
    
    oneController.arr_component_0 = arr_tmp;
    
    [oneController setMode:@"" object1:nil object2:nil indexpath:indexPath];
    
    [self.navigationController pushViewController:oneController animated:YES];

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
    
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            //days
            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
            
            oneController.title = @"Adverse event extended visit by";
            NSMutableArray *arr_tmp = [NSMutableArray arrayWithObjects:@"0 days", @"1-2 days", @"3-7 days", @"8-14 days", @"15-28 days", @"> 28 days", nil];
            
            oneController.arr_component_0 = arr_tmp;
            [self.navigationController pushViewController:oneController animated:YES];
        }
    }
}


- (IBAction)action_other_tf:(id)sender {
    dashboard.event_23 = _tv_other.text;
}

#pragma mark - switch actions
//16
//    dashboard.patient_received_allogenic_blood = (_sw_patient_receivedallogenic_blood.isOn) ? @"YES" : @"NO";
- (IBAction)action_sw_infaction0:(id)sender {
    dashboard.event_16_0 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}

- (IBAction)action_sw_infaction1:(id)sender {
    dashboard.event_16_1 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}

- (IBAction)action_sw_infaction2:(id)sender {
    dashboard.event_16_2 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}
- (IBAction)action_sw_infaction3:(id)sender {
    dashboard.event_16_3 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}


//19
- (IBAction)action_neurol_deterioration0:(id)sender {
    dashboard.event_19_0 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}


- (IBAction)action_neurol_deterioration1:(id)sender {
    dashboard.event_19_1 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}

- (IBAction)action_neurol_deterioration02:(id)sender {
    dashboard.event_19_2 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}







//22
- (IBAction)throm_0:(id)sender {
    dashboard.event_22_0 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}


- (IBAction)throm_1:(id)sender {
    dashboard.event_22_1 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}


//23
- (IBAction)wound_0:(id)sender {
    dashboard.event_23_0 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}

- (IBAction)wound_1:(id)sender {
    dashboard.event_23_1 = (((DCRoundSwitch *)sender).isOn) ? @"YES" : @"NO";
}






@end
