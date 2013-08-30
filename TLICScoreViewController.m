//
//  TLICScoreViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "TLICScoreViewController.h"
#import "Clipboard.h"   

@interface TLICScoreViewController ()

@end

@implementation TLICScoreViewController

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


    arr_sections = [NSMutableArray arrayWithObjects:_arr_section_0, _arr_section_1, _arr_section_2, nil];
    
    cell_section_1 = nil;
    cell_section_2 = nil;
    cell_section_3 = nil;
    
    self.title = @"TLIC Score : [0]";
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
    
    if(indexPath.section >= 0 && indexPath.section <= 2) {
        NSArray *arr_tmpSection = [arr_sections objectAtIndex:indexPath.section];
        
        
        for (UITableViewCell *currCell in arr_tmpSection)
        {
            currCell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
                
        //--- Save selected cell ---//
        switch (indexPath.section) {
            case 0:
                cell_section_1 = selectedCell;
                break;
            case 1:
                cell_section_2 = selectedCell;
                break;
            case 2:
                cell_section_3 = selectedCell;
                break;
            default:
                break;
        }
        
        //--- Display total ---//
        int i_total = 0;
        if(cell_section_1 != nil) i_total += [cell_section_1.detailTextLabel.text intValue];
        if(cell_section_2 != nil) i_total += [cell_section_2.detailTextLabel.text intValue];
        if(cell_section_3 != nil) i_total += [cell_section_3.detailTextLabel.text intValue];
        
        self.title = [NSString stringWithFormat:@"TLIC Score : [%d]", i_total];

    }
    else if(indexPath.section == 3){
        if(indexPath.row == 0) {
            // Confirm
            if(cell_section_1 != nil && cell_section_2 != nil && cell_section_3) {
                //--- save data
                dashboard.fracture_morphology_type = cell_section_1.textLabel.text;
                dashboard.neurologic_status = cell_section_2.textLabel.text;
                dashboard.plc = cell_section_3.textLabel.text;
                
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
    }
}

@end
