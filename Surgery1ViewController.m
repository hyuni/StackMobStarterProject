//
//  Surgery1ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/7/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "Surgery1ViewController.h"
#import "StackMob.h"
#import "Utility.h"
#import "PushPickerViewController.h"

@interface Surgery1ViewController ()

@end

@implementation Surgery1ViewController

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
    
    [self initSurgeryData];
    
    
}

- (void)initSurgeryData {
    NSManagedObjectContext *context = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    dashboard = [NSEntityDescription insertNewObjectForEntityForName:@"Dashboard" inManagedObjectContext:context];
    dashboard.patient_with_sci = @"YES";
    dashboard.intra_operative_adverse_events = @"NO";
    dashboard.vertebral_surgery = @"NO";
    dashboard.adjunctive_procedures = @"NO";
    dashboard.other_surgery = @"YES";
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"### Date Log : %@", self.dt_start.description);
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
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
            [tf_siteId addTarget:self action:@selector(didFinishTextEdit:) forControlEvents:UIControlEventEditingDidEndOnExit];
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"ASO Score"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
            
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Healthcard Number"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
            tf_healthcard = (UITextField *)[cell viewWithTag:3];
            [tf_healthcard addTarget:self action:@selector(didFinishTextEdit:) forControlEvents:UIControlEventEditingDidEndOnExit];
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Start/Time Date of Surgery"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3"];
            lb_startTime = (UILabel *)[cell viewWithTag:3];
            if(_dt_start != nil) {
                lb_startTime.text = [Utility dateTimeToString:_dt_start];
            }
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"End /Time Date of Surgery"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell4"];
            lb_endTime = (UILabel *)[cell viewWithTag:3];
            if(_dt_end != nil) {
                lb_endTime.text = [Utility dateTimeToString:_dt_end];
            }
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Estimated Blood Loss"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell5"];
            tf_estimatedBloodLoss = (UITextField *)[cell viewWithTag:3];
            [tf_estimatedBloodLoss addTarget:self action:@selector(didFinishTextEdit:) forControlEvents:UIControlEventEditingDidEndOnExit];
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Patient with SCI"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell6"];
        }
        else if([[arr_menu0 objectAtIndex:i_curRow] isEqualToString:@"Time from spinal cord injury to direct or indirect compression"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell7"];
            tf_timeCompression = (UITextField *)[cell viewWithTag:3];
            [tf_timeCompression addTarget:self action:@selector(didFinishTextEdit:) forControlEvents:UIControlEventEditingDidEndOnExit];
        }

    }
    else if(indexPath.section == 1) {
        if([[arr_menu1 objectAtIndex:i_curRow] isEqualToString:@"1. Intra-operative adverse events"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection2"];
            btn_section2_0 = (UIButton *)[cell viewWithTag:2];
            if ([dashboard.intra_operative_adverse_events isEqualToString:@"NO"]) {
                [btn_section2_0 setTitle:@"  " forState:UIControlStateNormal];
            }
            else {
                [btn_section2_0 setTitle:@"X" forState:UIControlStateNormal];
            }
            
            [btn_section2_0 addTarget:self action:@selector(action_btn_0:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([[arr_menu1 objectAtIndex:i_curRow] isEqualToString:@"2. Vertebral surgery"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection2"];
            btn_section2_1 = (UIButton *)[cell viewWithTag:2];
            if ([dashboard.vertebral_surgery isEqualToString:@"NO"]) {
                [btn_section2_1 setTitle:@"  " forState:UIControlStateNormal];
            }
            else {
                [btn_section2_1 setTitle:@"X" forState:UIControlStateNormal];
            }
            
            [btn_section2_1 addTarget:self action:@selector(action_btn_1:) forControlEvents:UIControlEventTouchUpInside];

            
        }
        else if([[arr_menu1 objectAtIndex:i_curRow] isEqualToString:@"3. Adjunctive procedures"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection2"];
            btn_section2_2 = (UIButton *)[cell viewWithTag:2];
            if ([dashboard.adjunctive_procedures isEqualToString:@"NO"]) {
                [btn_section2_2 setTitle:@"  " forState:UIControlStateNormal];
            }
            else {
                [btn_section2_2 setTitle:@"X" forState:UIControlStateNormal];
            }
            
            [btn_section2_2 addTarget:self action:@selector(action_btn_2:) forControlEvents:UIControlEventTouchUpInside];

        }
        else if([[arr_menu1 objectAtIndex:i_curRow] isEqualToString:@"4. Other surgery"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellSection2"];
            btn_section2_3 = (UIButton *)[cell viewWithTag:2];
            if ([dashboard.other_surgery isEqualToString:@"NO"]) {
                [btn_section2_3 setTitle:@"  " forState:UIControlStateNormal];
            }
            else {
                [btn_section2_3 setTitle:@"X" forState:UIControlStateNormal];
            }
            
            [btn_section2_3 addTarget:self action:@selector(action_btn_3:) forControlEvents:UIControlEventTouchUpInside];
        }

        // set label
        [(UILabel *)[cell viewWithTag:1] setText:[arr_menu1 objectAtIndex:i_curRow]];
    }
    else {
        // error
    }
    
    return cell;
}

- (void)didFinishTextEdit:(id)sender {
    [sender resignFirstResponder];
}


#pragma mark - selector method
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
        
    if(indexPath.section == 0) {
        if(indexPath.row == 3) {
            PushPickerViewController *pPicker = [[PushPickerViewController alloc] initWithNibName:@"PushPickerViewController" bundle:nil];
            pPicker.dt_target = &_dt_start;
            [self.navigationController pushViewController:pPicker animated:YES];
        }
        else if(indexPath.row == 4) {
            PushPickerViewController *pPicker = [[PushPickerViewController alloc] initWithNibName:@"PushPickerViewController" bundle:nil];
            pPicker.dt_target = &_dt_end;
            [self.navigationController pushViewController:pPicker animated:YES];
        }
        else {

        }
    }
    else if(indexPath.section == 1) {
        if(indexPath.row == 0) {
            if([dashboard.intra_operative_adverse_events isEqualToString:@"YES"]) {
                
            }
        }
        else if(indexPath.row == 1) {
            if([dashboard.vertebral_surgery isEqualToString:@"YES"]) {
                
            }
        }
        else if(indexPath.row == 2) {
            if([dashboard.adjunctive_procedures isEqualToString:@"YES"]) {
                
            }
        }
        else if(indexPath.row == 3) {
            if([dashboard.other_surgery isEqualToString:@"YES"]) {
                
            }
        }
        
    }
    else {
        // error
    }
    
    
}



@end
