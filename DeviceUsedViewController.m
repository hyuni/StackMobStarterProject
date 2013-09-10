//
//  DeviceUsedViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/10/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "DeviceUsedViewController.h"

@interface DeviceUsedViewController ()

@end

@implementation DeviceUsedViewController

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
    arr_menu_bool = [[NSMutableArray alloc] initWithObjects:dashboard.flxation_non, dashboard.flxation_plate, dashboard.flxation_rod, dashboard.flxation_arth, dashboard.flxation_interspinous, dashboard.flxation_cannulated, dashboard.flxation_synthetic, dashboard.flxation_interbody, dashboard.flxation_other, nil];
    
    arr_menu = [[NSMutableArray alloc] init];
    [arr_menu addObject:@"None"];
    [arr_menu addObject:@"Plate"];
    [arr_menu addObject:@"Rod-Screw Construct"];
    [arr_menu addObject:@"Arthroplasty"];
    [arr_menu addObject:@"Interspinous Device"];
    [arr_menu addObject:@"Cannulated Screw"];
    [arr_menu addObject:@"Synthetic Cage"];
    [arr_menu addObject:@"Interbody Bone Graft"];
    [arr_menu addObject:@"Other"];
    
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
    if(section == 0)
        return [arr_menu count];
    else
        return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = nil;
    if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Other"]) {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"CellOther"];
        return 178;
    }
    else {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1Label"];
        return 45;
    }
    
//    return cell.frame.size.height;
//    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    UITableViewCell *cell = nil;
    
    if(indexPath.section == 0) {
        if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Other"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellOther"];
            UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
            lb_title.text = [arr_menu objectAtIndex:indexPath.row];
            
            tv_other = (UITextView *)[cell viewWithTag:4];
            tv_other.text = dashboard.flxation_other_detail;
            
        }
        else {
            // except other
            cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1Label"];
            UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
            lb_title.text = [arr_menu objectAtIndex:indexPath.row];
            
        }
        
        UIButton *btn_yes = (UIButton *)[cell viewWithTag:2];
        if([[arr_menu_bool objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
            //NO
            [btn_yes setTitle:@"  " forState:UIControlStateNormal];
        }
        else {
            [btn_yes setTitle:@"X" forState:UIControlStateNormal];
        }
        [btn_yes addTarget:self action:@selector(action_btn_yes:) forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        // back to surgery form
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellBack"];
    }
    

    return cell;
}

- (void)action_btn_yes:(id)sender {
    CGPoint buttonOriginInTableView = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonOriginInTableView];
    
    
    NSString *str_tmp = [arr_menu_bool objectAtIndex:indexPath.row];
    str_tmp = ([str_tmp isEqualToString:@"1"] ? @"0" : @"1");
    
    
    switch (indexPath.row) {
        case 0:
            dashboard.flxation_non = str_tmp;
            break;
        case 1:
            dashboard.flxation_plate = str_tmp;
            break;
        case 2:
            dashboard.flxation_rod = str_tmp;
            break;
        case 3:
            dashboard.flxation_arth = str_tmp;
            break;
        case 4:
            dashboard.flxation_interspinous = str_tmp;
            break;
        case 5:
            dashboard.flxation_cannulated = str_tmp;
            break;
        case 6:
            dashboard.flxation_synthetic = str_tmp;
            break;
        case 7:
            dashboard.flxation_interbody = str_tmp;
            break;
        case 8:
            dashboard.flxation_other = str_tmp;
            break;

        default:
            break;
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
    if(indexPath.section == 0) {
        if(indexPath.row == 8)
            return;
        
        if(indexPath.row == 0 && [dashboard.flxation_non isEqualToString:@"1"]) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            DeviceUseViewController *deviceController = [storyboard instantiateViewControllerWithIdentifier:@"DeviceUseViewController"];
            deviceController.title = [arr_menu objectAtIndex:indexPath.row];
            deviceController.str_detailData = dashboard.flxation_non_detail;
            deviceController.delegate = self;
            [self.navigationController pushViewController:deviceController animated:YES];
        }
        else if(indexPath.row == 1 && [dashboard.flxation_plate isEqualToString:@"1"]) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            DeviceUseViewController *deviceController = [storyboard instantiateViewControllerWithIdentifier:@"DeviceUseViewController"];
            deviceController.title = [arr_menu objectAtIndex:indexPath.row];
            deviceController.str_detailData = dashboard.flxation_plate_detail;
            deviceController.delegate = self;
            [self.navigationController pushViewController:deviceController animated:YES];
        }
        else if(indexPath.row == 2 && [dashboard.flxation_rod isEqualToString:@"1"]) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            DeviceUseViewController *deviceController = [storyboard instantiateViewControllerWithIdentifier:@"DeviceUseViewController"];
            deviceController.title = [arr_menu objectAtIndex:indexPath.row];
            deviceController.str_detailData = dashboard.flxation_rod_detail;
            deviceController.delegate = self;
            [self.navigationController pushViewController:deviceController animated:YES];
        }
        else if(indexPath.row == 3 && [dashboard.flxation_arth isEqualToString:@"1"]) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            DeviceUseViewController *deviceController = [storyboard instantiateViewControllerWithIdentifier:@"DeviceUseViewController"];
            deviceController.title = [arr_menu objectAtIndex:indexPath.row];
            deviceController.str_detailData = dashboard.flxation_arth_detail;
            deviceController.delegate = self;
            [self.navigationController pushViewController:deviceController animated:YES];
        }
        else if(indexPath.row == 4 && [dashboard.flxation_interspinous isEqualToString:@"1"]) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            DeviceUseViewController *deviceController = [storyboard instantiateViewControllerWithIdentifier:@"DeviceUseViewController"];
            deviceController.title = [arr_menu objectAtIndex:indexPath.row];
            deviceController.str_detailData = dashboard.flxation_interspinous_detail;
            deviceController.delegate = self;
            [self.navigationController pushViewController:deviceController animated:YES];
        }
        else if(indexPath.row == 5 && [dashboard.flxation_cannulated isEqualToString:@"1"]) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            DeviceUseViewController *deviceController = [storyboard instantiateViewControllerWithIdentifier:@"DeviceUseViewController"];
            deviceController.title = [arr_menu objectAtIndex:indexPath.row];
            deviceController.str_detailData = dashboard.flxation_cannulated_detail;
            deviceController.delegate = self;
            [self.navigationController pushViewController:deviceController animated:YES];
        }
        else if(indexPath.row == 6 && [dashboard.flxation_synthetic isEqualToString:@"1"]) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            DeviceUseViewController *deviceController = [storyboard instantiateViewControllerWithIdentifier:@"DeviceUseViewController"];
            deviceController.title = [arr_menu objectAtIndex:indexPath.row];
            deviceController.str_detailData = dashboard.flxation_synthetic_detail;
            deviceController.delegate = self;
            [self.navigationController pushViewController:deviceController animated:YES];
        }
        else if(indexPath.row == 7 && [dashboard.flxation_interbody isEqualToString:@"1"]) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            DeviceUseViewController *deviceController = [storyboard instantiateViewControllerWithIdentifier:@"DeviceUseViewController"];
            deviceController.title = [arr_menu objectAtIndex:indexPath.row];
            deviceController.str_detailData = dashboard.flxation_interbody_detail;
            deviceController.delegate = self;
            [self.navigationController pushViewController:deviceController animated:YES];
        }

    }
    else if(indexPath.section == 1 && indexPath.row == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)didFinishedDeviceUse:(NSMutableArray *)arr_result {
    
    /*
    [arr_menu addObject:@"None"];
    [arr_menu addObject:@"Plate"];
    [arr_menu addObject:@"Rod-Screw Construct"];
    [arr_menu addObject:@"Arthroplasty"];
    [arr_menu addObject:@"Interspinous Device"];
    [arr_menu addObject:@"Cannulated Screw"];
    [arr_menu addObject:@"Synthetic Cage"];
    [arr_menu addObject:@"Interbody Bone Graft"];
    [arr_menu addObject:@"Other"];
     */
    
    NSString* str_tmpTitle = [arr_result lastObject];
    if([str_tmpTitle isEqualToString:@"None"]) {
        dashboard.flxation_non_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Plate"]) {
        dashboard.flxation_plate_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Rod-Screw Construct"]) {
        dashboard.flxation_rod_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Arthroplasty"]) {
        dashboard.flxation_arth_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Interspinous Device"]) {
        dashboard.flxation_interspinous_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Cannulated Screw"]) {
        dashboard.flxation_cannulated_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Synthetic Cage"]) {
        dashboard.flxation_synthetic_detail = [arr_result objectAtIndex:0];
    }
    else if([str_tmpTitle isEqualToString:@"Interbody Bone Graft"]) {
        dashboard.flxation_interbody_detail = [arr_result objectAtIndex:0];
    }
}


- (void)textViewDidChange:(UITextView *)textView {
    dashboard.flxation_other_detail = tv_other.text;
}

@end
