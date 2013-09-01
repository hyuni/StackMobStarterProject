//
//  IntakeForm1ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/28/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "IntakeForm1ViewController.h"
#import "IntakeForm2ViewController.h"
#import "StackMob.h"
#import "Utility.h"
#import "Clipboard.h"

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
    datePickerViewController = [[NewDatePickerViewController alloc] initWithNibName:@"NewDatePickerViewController" bundle:nil];
    datePickerView = [datePickerViewController getDatePickerView:self];
    [self.view addSubview:datePickerView];
    
    //--- Date of Birth Setting ---//
    _lb_dataOfBirth.text = [Utility dateToString:[NSDate date]];
    
    //--- Data prepare ---//
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    dashboard = [NSEntityDescription insertNewObjectForEntityForName:@"Dashboard" inManagedObjectContext:context];
    //--- initiallize dashboard data---//
    dashboard.dashboard_id = [dashboard assignObjectId];
    dashboard.injurytype = @"";
    dashboard.injurylevel = @"";
    dashboard.neurologicallyintact = @"NO";
    dashboard.fracturetype = @"";
    dashboard.degree_kyphosis = @"";
    dashboard.height_loss = @"";
    dashboard.tlic_score = @"";
    dashboard.tlic_score_total = @"";
    dashboard.hangman = @"";
    dashboard.height_loss = @"";
    dashboard.asia_motor_r = @"5555555555";
    dashboard.asia_motor_l = @"5555555555";
    dashboard.asia_motor_l_subtotal = @"50";
    dashboard.asia_motor_r_subtotal = @"50";
    dashboard.asia_motor_total = @"100";
    dashboard.asia_lighttouch_l = @"2222222222222222222222222222";
    dashboard.asia_lighttouch_r = @"2222222222222222222222222222";
    dashboard.asia_lighttouch_l_subtotal = @"112";
    dashboard.asia_lighttouch_r_subtotal = @"112";
    dashboard.asia_lighttouch_total = @"224";
    dashboard.asia_pinpric_l = @"2222222222222222222222222222";
    dashboard.asia_pinpric_r = @"2222222222222222222222222222";
    dashboard.asia_pinpric_l_subtotal = @"112";
    dashboard.asia_pinpric_r_subtotal = @"112";
    dashboard.asia_pinpric_total = @"224";
    dashboard.voluntary_anal_contraction = @"NO";
    dashboard.anal_sensation = @"NO";
    dashboard.complete_or_incomplete = @"NO";
    dashboard.neurological_level = @"";
    dashboard.n_sensory_l = @"";
    dashboard.n_sensory_r = @"";
    dashboard.n_motor_l = @"";
    dashboard.n_motor_r = @"";
    dashboard.zone_partial_preservation = @"";
    dashboard.z_sensory_l = @"";
    dashboard.z_sensory_r = @"";
    dashboard.z_motor_l = @"";
    dashboard.z_motor_r = @"";
    dashboard.admit_to_hospital = @"NO";
    dashboard.follow_up_required = @"NO";
    dashboard.brace_required = @"NO";
    dashboard.surgery_required = @"NO";
    dashboard.date_of_surgery = @"";
    dashboard.surgical_billing_code = @"";
    
    
    
    
    
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                                          action:@selector(dismissKeyboard)];
//    
//    [self.view addGestureRecognizer:tap];

}

//- (void)dismissKeyboard {
//    [_tf_healthCardNumber resignFirstResponder];
//}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    
//    [[self view] endEditing:TRUE];
//    
//}


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
        [datePickerViewController moveUpPickerView];
        [_tf_healthCardNumber resignFirstResponder];
    }
}

#pragma mark - Custom Method

//- (IBAction)btn_confirm:(id)sender {
//    [self modalDown:nil];
//    _lb_dataOfBirth.text = [Utility dateToString:_dp_dateOfBirth.date];
//}

#pragma mark - TextField delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [datePickerViewController moveDownPickerView:nil];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_tf_healthCardNumber resignFirstResponder];
    return YES;
}

#pragma mark - Segue delegate
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *str_cardNumber = _tf_healthCardNumber.text;
    if(str_cardNumber.length > 0) return YES;
    else return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    dashboard.healthcard_number = _tf_healthCardNumber.text;
    dashboard.date_of_birth = _lb_dataOfBirth.text;
    
    Clipboard *clip = [Clipboard sharedClipboard];
    [clip clipValue:dashboard clipKey:@"create_intake"];
    
    
    
//	if ([segue.identifier isEqualToString:@"Intake1to2"]) {
//        IntakeForm2ViewController *nextViewController = segue.destinationViewController;
//        
//    }
}

#pragma mark - NewDatePickerViewController delegate
-(void)delegateConfirm:(NSDate *)date_selected {
    _lb_dataOfBirth.text = [Utility dateToString:date_selected];
}

@end
