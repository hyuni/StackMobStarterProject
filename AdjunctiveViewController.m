//
//  AdjunctiveViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/10/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "AdjunctiveViewController.h"
#import "Clipboard.h"
#import "KKDS_Preference.h"

@interface AdjunctiveViewController ()

@end

@implementation AdjunctiveViewController

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
    [arr_menu addObject:@"Intraoperative monitoring"];
    if([dashboard.adj_monitoring isEqualToString:@"YES"]) {
        [arr_menu addObject:@"None"];
        [arr_menu addObject:@"EMG"];
        [arr_menu addObject:@"Motor"];
        [arr_menu addObject:@"Sensory"];
    }
    
    [arr_menu addObject:@"Intraoperative imaging"];
    if([dashboard.adj_imaging isEqualToString:@"YES"]) {
        [arr_menu addObject:@"None "];
        [arr_menu addObject:@"X-Ray "];
        [arr_menu addObject:@"Fluroscopy "];
        [arr_menu addObject:@"CT / 3D "];
    }
    [arr_menu addObject:@"Navigation"];
    
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
        if([str_tmpMenuName isEqualToString:@"Intraoperative monitoring"]) {
            CellIdentifier = @"CellDefault";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setTitle:([dashboard.adj_monitoring isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Intraoperative imaging"]) {
            CellIdentifier = @"CellDefault";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setTitle:([dashboard.adj_imaging isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Navigation"]) {
            CellIdentifier = @"CellBasic";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            sw_navigation = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
            [sw_navigation setOffText:@"NO"];
            [sw_navigation setOnText:@"YES"];
            if([dashboard.adj_navigation isEqualToString:@"YES"]) [sw_navigation setOn:YES animated:NO ignoreControlEvents:YES];
            else [sw_navigation setOn:NO animated:NO ignoreControlEvents:YES];
            [cell addSubview:sw_navigation];
            [sw_navigation addTarget:self action:@selector(action_sw_navigation:) forControlEvents:UIControlEventValueChanged];

        }
        //Sub Menu
        else if([str_tmpMenuName isEqualToString:@"None"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setTitle:([dashboard.adj_monitoring_non isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"EMG"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setTitle:([dashboard.adj_monitoring_emg isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Motor"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setTitle:([dashboard.adj_monitoring_motor isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Sensory"]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setTitle:([dashboard.adj_monitoring_sensory isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"None "]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setTitle:([dashboard.adj_imaging_none isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"X-Ray "]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setTitle:([dashboard.adj_imaging_x_ray isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"Fluroscopy "]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setTitle:([dashboard.adj_imaging_fluroscopy isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
            [btn_x addTarget:self action:@selector(action_btn_x:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if([str_tmpMenuName isEqualToString:@"CT / 3D "]) {
            CellIdentifier = @"CellSub";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            UIButton *btn_x = (UIButton *)[cell viewWithTag:2];
            [btn_x setTitle:([dashboard.adj_imaging_ct_3d isEqualToString:@"YES"] ? @"YES" : @"NO") forState:UIControlStateNormal];
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

- (void)action_sw_navigation:(id)sender {
    dashboard.adj_navigation = ([dashboard.adj_navigation isEqualToString:@"YES"] ? @"NO" : @"YES");
}

- (void)action_btn_x:(id)sender {
    CGPoint buttonOriginInTableView = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonOriginInTableView];
    
    NSString *str_tmpMenuName = [arr_menu objectAtIndex:indexPath.row];
    if([str_tmpMenuName isEqualToString:@"Intraoperative monitoring"]) {
        dashboard.adj_monitoring = ([dashboard.adj_monitoring isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"None"]) {
        dashboard.adj_monitoring_non = ([dashboard.adj_monitoring_non isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"EMG"]) {
        dashboard.adj_monitoring_emg = ([dashboard.adj_monitoring_emg isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Motor"]) {
        dashboard.adj_monitoring_motor = ([dashboard.adj_monitoring_motor isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Sensory"]) {
        dashboard.adj_monitoring_sensory = ([dashboard.adj_monitoring_sensory isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Intraoperative imaging"]) {
        dashboard.adj_imaging = ([dashboard.adj_imaging isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"None "]) {
        dashboard.adj_imaging_none = ([dashboard.adj_imaging_none isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"X-Ray "]) {
        dashboard.adj_imaging_x_ray = ([dashboard.adj_imaging_x_ray isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"Fluroscopy "]) {
        dashboard.adj_imaging_fluroscopy = ([dashboard.adj_imaging_fluroscopy isEqualToString:@"YES"] ? @"NO" : @"YES");
    }
    else if([str_tmpMenuName isEqualToString:@"CT / 3D "]) {
        dashboard.adj_imaging_ct_3d = ([dashboard.adj_imaging_ct_3d isEqualToString:@"YES"] ? @"NO" : @"YES");
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
}

@end
