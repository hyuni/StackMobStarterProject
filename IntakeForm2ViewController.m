//
//  IntakeForm2ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/28/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "IntakeForm2ViewController.h"
#import "Utility.h"
#import "Clipboard.h"   
#import "StackMob.h"
#import "OnePickerViewController.h"


@interface IntakeForm2ViewController ()

@end

@implementation IntakeForm2ViewController

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
    
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                                          action:@selector(dismissKeyboard)];
//    
//    [self.view addGestureRecognizer:tap];
    
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];

}

- (void)initScreenData {
    //--- date setting ---//
    //--- Date of Birth Setting ---//
    _lb_date.text = dashboard.occur_date;
    _lb_visitType.text = dashboard.visit_type;
    _tf_billingCode.text = dashboard.billingcode;

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self initScreenData];
}

- (void)dismissKeyboard {

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
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            //--- Date ---//
            [datePickerViewController moveUpPickerView];
        }
        else if(indexPath.row == 1) {
            // visit type
            ModalPickerViewController *modalController = [[ModalPickerViewController alloc] initWithNibName:@"ModalPickerViewController" bundle:nil];
            modalController.delegate = self;
            NSMutableArray *arr_sources = [[NSMutableArray alloc] init];
            [arr_sources addObject:[NSMutableArray arrayWithObjects:@"Phone call", @"Emergency", @"Clinic", nil]];
            modalController.arr_sources = arr_sources;
//            NSString *str_title = @"Visit Type";
            modalController.tag = @"Visit Type";
//            [modalController setToolbarTitle:str_title];
            [self presentViewController:modalController animated:YES completion:nil];
            
            
//            OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
//            
//            oneController.title = @"Visit Type";
//            NSMutableArray *arr_tmp = [NSMutableArray arrayWithObjects:@"Phone call", @"Emergency", @"Clinic", nil];
//            
//            oneController.arr_component_0 = arr_tmp;
//            
//            [oneController setMode:@"" object1:nil object2:nil indexpath:indexPath];
//            
//            [self.navigationController pushViewController:oneController animated:YES];
        }
    }
}

#pragma mark - ModalPickerViewController
-(void)didFinishedModalPickerConfirmed:(NSMutableArray *)arr_selectedItems tag:(id)tag {
    //            [arr_menu0 addObject:@"Start/Time Date of Surgery"];
    //            [arr_menu0 addObject:@"End /Time Date of Surgery"];
    
    if([tag isEqualToString:@"Visit Type"]) {
        dashboard.visit_type = [arr_selectedItems objectAtIndex:0];
    }
    [self.tableView reloadData];
}

//- (IBAction)modalUp:(id)sender {
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationBeginsFromCurrentState:YES];
//    [UIView setAnimationDuration:0.3f];
//    
//    CGRect tmpRect = _modalView.frame;
//    tmpRect.origin.x = 0;
//    tmpRect.origin.y = self.view.frame.size.height - _modalView.frame.size.height;
//    _modalView.frame = tmpRect;
//    
//    [UIView commitAnimations];
//    
//    //--- keyboard down ---/
//    [_tf_healthCardNumber resignFirstResponder];
//}

#pragma mark - NewDatePickerViewController delegate
-(void)delegateConfirm:(NSDate *)date_selected {
//    _lb_date.text = [Utility dateToString:date_selected];
    dashboard.occur_date = [Utility dateToString:date_selected];
    [self viewWillAppear:NO];
}

#pragma mark - Segue delegate
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if([_lb_date.text length] > 0)
        return YES;
    else
        return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self saveCurrentScreenData];
    
//	if ([segue.identifier isEqualToString:@"Intake1to2"]) {
//        IntakeForm2ViewController *nextViewController = segue.destinationViewController;
//
//    }
}

#pragma mark - custom method

- (void)saveCurrentScreenData {
    dashboard.occur_date = _lb_date.text;
    dashboard.visit_type = _lb_visitType.text;
    dashboard.billingcode = _tf_billingCode.text;
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

- (IBAction)tf_billingCodeDone:(id)sender {
    [_tf_billingCode resignFirstResponder];
}

@end


