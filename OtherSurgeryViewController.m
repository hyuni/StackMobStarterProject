//
//  OtherSurgeryViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/10/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "OtherSurgeryViewController.h"
#import "Clipboard.h"
#import "KKDS_Preference.h"

@interface OtherSurgeryViewController ()

@end

@implementation OtherSurgeryViewController

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
    dashboard = [clip clipKey:@"create_surgery"];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    arr_menu = [[NSMutableArray alloc] init];
    [arr_menu addObject:@"Cord or Nerve"];
    if([dashboard.oth_cord isEqualToString:@"YES"]) {
        [arr_menu addObject:@"Exploration & Restoration of Subarachnoid Space"];
        [arr_menu addObject:@"Repair Meningocele"];
        [arr_menu addObject:@"Release Tethered Cord"];
        [arr_menu addObject:@"Rhizotomy"];
        [arr_menu addObject:@"Drez Lesion"];
        [arr_menu addObject:@"Not applicable"];
    }
    
    [arr_menu addObject:@"Pumps"];
    if([dashboard.oth_pumps isEqualToString:@"YES"]) {
        [arr_menu addObject:@"Replacement / Removal / Implant infusion pump"];
        [arr_menu addObject:@"Spinal simulator to include generator / receiver"];
        [arr_menu addObject:@"Not applicable "];
    }
    
    [arr_menu addObject:@"Drainage"];
    if([dashboard.oth_drainage isEqualToString:@"YES"]) {
        [arr_menu addObject:@"Lumboperitoneal shunt"];
        [arr_menu addObject:@"Syringoperitoneal shunt"];
        [arr_menu addObject:@"Not applicable  "];
    }
    
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
        return [arr_menu count];
    }
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    NSString *CellIdentifier = nil;
    NSString *str_tmpMenuName = [arr_menu objectAtIndex:indexPath.row];
    if(indexPath.section == 0) {
        //Main Menu
        if([str_tmpMenuName isEqualToString:@"Cord or Nerve"]) {
            CellIdentifier = @"CellDefault";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_cord isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Pumps"]) {
            CellIdentifier = @"CellDefault";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_pumps isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Drainage"]) {
            CellIdentifier = @"CellDefault";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_drainage isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        //Sub Menu
        else if([str_tmpMenuName isEqualToString:@"Exploration & Restoration of Subarachnoid Space"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_cord_exploration isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Repair Meningocele"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_cord_repair isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Release Tethered Cord"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_cord_release isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Rhizotomy"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_cord_rhizotomy isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Drez Lesion"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_cord_drez isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Not applicable"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_cord_not isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Replacement / Removal / Implant infusion pump"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_pumps_replacement isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Spinal simulator to include generator / receiver"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_pumps_spinal isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Not applicable "]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_pumps_not isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Lumboperitoneal shunt"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_drainage_lumboperitoneal isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Syringoperitoneal shunt"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_drainage_syringoperitoneal isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Not applicable  "]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setBackgroundImage:[UIImage imageNamed:([dashboard.oth_drainage_not isEqualToString:@"YES"] ? @"checkbox_on" : @"checkbox_off")] forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    else if(indexPath.section == 1) {
        //return
        CellIdentifier = @"CellBack";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    else {
        //error
        CellIdentifier = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
    lb_title.text = str_tmpMenuName;
    
    return cell;
}

- (void)action_btn_x:(id)sender {
    CGPoint buttonOriginInTableView = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonOriginInTableView];
    
    NSString *str_tmpMenuName = [arr_menu objectAtIndex:indexPath.row];
    if([str_tmpMenuName isEqualToString:@"Cord or Nerve"]) {
        dashboard.oth_cord = ([dashboard.oth_cord isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Exploration & Restoration of Subarachnoid Space"]) {
        dashboard.oth_cord_exploration = ([dashboard.oth_cord_exploration isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Repair Meningocele"]) {
        dashboard.oth_cord_repair = ([dashboard.oth_cord_repair isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Release Tethered Cord"]) {
        dashboard.oth_cord_release = ([dashboard.oth_cord_release isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Rhizotomy"]) {
        dashboard.oth_cord_rhizotomy = ([dashboard.oth_cord_rhizotomy isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Drez Lesion"]) {
        dashboard.oth_cord_drez = ([dashboard.oth_cord_drez isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Not applicable"]) {
        dashboard.oth_cord_not = ([dashboard.oth_cord_not isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Pumps"]) {
        dashboard.oth_pumps = ([dashboard.oth_pumps isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Replacement / Removal / Implant infusion pump"]) {
        dashboard.oth_pumps_replacement = ([dashboard.oth_pumps_replacement isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Spinal simulator to include generator / receiver"]) {
        dashboard.oth_pumps_spinal = ([dashboard.oth_pumps_spinal isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Not applicable "]) {
        dashboard.oth_pumps_not = ([dashboard.oth_pumps_not isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Drainage"]) {
        dashboard.oth_drainage = ([dashboard.oth_drainage isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Lumboperitoneal shunt"]) {
        dashboard.oth_drainage_lumboperitoneal = ([dashboard.oth_drainage_lumboperitoneal isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Syringoperitoneal shunt"]) {
        dashboard.oth_drainage_syringoperitoneal = ([dashboard.oth_drainage_syringoperitoneal isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Not applicable  "]) {
        dashboard.oth_drainage_not = ([dashboard.oth_drainage_not isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    
    [self viewWillAppear:NO];
    
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
    
    if(indexPath.section == 1 && indexPath.row == 0) {
        //return
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
