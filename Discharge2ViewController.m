//
//  Discharge2ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/1/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "Discharge2ViewController.h"
#import "Clipboard.h"   

@interface Discharge2ViewController ()

@end

@implementation Discharge2ViewController

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
 
    flag_first = YES;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)];
    self.navigationItem.rightBarButtonItem = confirmButton;
    
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = [clip clipKey:@"create_discharge"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardDidHideNotification object:nil];

    _tv_other.text = dashboard.patient_discharged_to;
}

- (void)viewWillAppear:(BOOL)animated {
    if([dashboard.patient_discharged_to isEqualToString:@"Home, unsupervised"]) {
        selected_row = 0;
    }
    else if([dashboard.patient_discharged_to isEqualToString:@"Home, supervised"]) {
        selected_row = 1;
    }
    else if([dashboard.patient_discharged_to isEqualToString:@"In-patient rehabilitation"]) {
        selected_row = 2;
    }
    else if([dashboard.patient_discharged_to isEqualToString:@"Short-term convalescent care"]) {
        selected_row = 3;
    }
    else if([dashboard.patient_discharged_to isEqualToString:@"Nursing home"]) {
        selected_row = 4;
    }
    else if([dashboard.patient_discharged_to isEqualToString:@"Hospital-hospital transfer"]) {
        selected_row = 6;
    }
    else {
        // other
        selected_row = 6;
    }

    [self.tableView reloadData];
}

- (void)confirm:(id)sender {
    dashboard.patient_discharged_to = _tv_other.text;
    [self.navigationController popViewControllerAnimated:YES];
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
    if(indexPath.row == selected_row) {
        if(selected_row != 6)
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
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
-(void) keyboardShown:(NSNotification*) notification {
    _initialTVHeight = self.tableView.frame.size.height;
    
    CGRect initialFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect convertedFrame = [self.view convertRect:initialFrame fromView:nil];
    CGRect tvFrame = self.tableView.frame;
    tvFrame.size.height = convertedFrame.origin.y;
    self.tableView.frame = tvFrame;
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
    
    for(UITableViewCell *curCell in _cells) {
        curCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    switch (indexPath.row) {
        case 0:
            dashboard.patient_discharged_to = @"Home, unsupervised";
            break;
        case 1:
            dashboard.patient_discharged_to = @"Home, supervised";
            break;
        case 2:
            dashboard.patient_discharged_to = @"In-patient rehabilitation";
            break;
        case 3:
            dashboard.patient_discharged_to = @"Short-term convalescent care";
            break;
        case 4:
            dashboard.patient_discharged_to = @"Nursing home";
            break;
        case 5:
            dashboard.patient_discharged_to = @"Hospital-hospital transfer";
            break;
        case 6:
            dashboard.patient_discharged_to = _tv_other.text;
            cell.accessoryType = UITableViewCellAccessoryNone;
            break;
        default:
            break;
    }
}



@end
