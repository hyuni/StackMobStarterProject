//
//  IntakeMotorViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "IntakeMotorViewController.h"
#import "Clipboard.h"
#import "OnePickerViewController.h"
#import "LightInfoViewController.h"

@interface IntakeMotorViewController ()

@end

@implementation IntakeMotorViewController

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
    arr_cells = [NSMutableArray arrayWithObjects: _cell_0, _cell_1, _cell_2, _cell_3, _cell_4, _cell_5, _cell_6, _cell_7, _cell_8, _cell_9, _cell_10, _cell_11, nil];
    
    //--- set data ---//
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];

    arr_asia_motor_r = [self setMotorData:dashboard.asia_motor_r];
    arr_asia_motor_l = [self setMotorData:dashboard.asia_motor_l];
    
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
	[infoButton addTarget:self action:@selector(infoButtonAction) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *modalButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
	[self.navigationItem setRightBarButtonItem:modalButton animated:YES];
    
}

- (void)infoButtonAction {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    LightInfoViewController *info = [storyboard instantiateViewControllerWithIdentifier:@"LightInfoViewController"];
    
    info.title = @"Info";
    
    [info setInfoText:@"Muscle strength grading \n \n0 - Total paralysis \n1 - Palpable or visible contraction \n2 - Active movement, gravity eliminated \n3 - Active movement, against gravity \n4 - Active movement, against some resistance \n5 - Active movement, against full resistance \nN - Not testable"];
    
    [self.navigationController pushViewController:info animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {    
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source & delegate
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
    
    // Configure the cell...
    UITableViewCell *cell = nil;
    if(indexPath.section == 0) {
        cell = [arr_cells objectAtIndex:indexPath.row];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIButton *btn_right = (UIButton *)[cell viewWithTag:1];
        UIButton *btn_left = (UIButton *)[cell viewWithTag:2];
        btn_right.userInteractionEnabled = NO;
        btn_left.userInteractionEnabled = NO;

        
        if(indexPath.row < 10) {
            [btn_right setTitle:[arr_asia_motor_r objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            [btn_left setTitle:[arr_asia_motor_l objectAtIndex:indexPath.row] forState:UIControlStateNormal];    
        }
        else if(indexPath.row == 10){
            //sub total
            cell.userInteractionEnabled = NO;
            
            int i_subtotal_r = 0;
            int i_subtotal_l = 0;

            for(NSString *str_curNum in arr_asia_motor_r) {
                i_subtotal_r += [str_curNum intValue];
            }
            
            for(NSString *str_curNum in arr_asia_motor_l) {
                i_subtotal_l += [str_curNum intValue];
            }
            
            [btn_right setTitle:[NSString stringWithFormat:@"%d", i_subtotal_r] forState:UIControlStateNormal];
            [btn_left setTitle:[NSString stringWithFormat:@"%d", i_subtotal_l] forState:UIControlStateNormal];
            
            // save for total
            i_total = i_subtotal_r + i_subtotal_l;
            
            // selector for change value
//            [btn_right addTarget:self action:@selector(action_btn_pressed:) forControlEvents:UIControlEventTouchUpInside];
            
            
        }
        else if(indexPath.row == 11){
            //total
            cell.userInteractionEnabled = NO;
            
            UIButton *btn_total = (UIButton *)[cell viewWithTag:3];
            [btn_total setTitle:[NSString stringWithFormat:@"%d", i_total] forState:UIControlStateNormal];
        }
        else {
            //exception
        }
        
        
    }
    else {
        // confirm cell
        cell = _cell_confirm;
    }
    
    return cell;
}

//- (void)action_btn_pressed:(id)sender {
//    OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
//    
//    oneController.title = @"Motor";
//    
//    NSMutableArray *arr_tmp = [NSMutableArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"N", nil];
//    oneController.arr_component_0 = arr_tmp;
//    
//    
//    
//    [self.navigationController pushViewController:oneController animated:YES];
//
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
        
        oneController.title = @"Motor";
        
        NSMutableArray *arr_tmp = [NSMutableArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"N", nil];
        oneController.arr_component_0 = arr_tmp;
        [oneController setMode:@"duplicated" object1:arr_asia_motor_r object2:arr_asia_motor_l indexpath:indexPath];
        
        [self.navigationController pushViewController:oneController animated:YES];
    }
    else {
        //--- confirm ---//
        NSMutableString *mStr_r = [[NSMutableString alloc] init];
        NSMutableString *mStr_l = [[NSMutableString alloc] init];
        
        for(NSString *str_cur in arr_asia_motor_r) {
            [mStr_r appendString:str_cur];
        }
        dashboard.asia_motor_r = mStr_r;
        
        for(NSString *str_cur in arr_asia_motor_l) {
            [mStr_l appendString:str_cur];
        }
        dashboard.asia_motor_l = mStr_l;

        dashboard.asia_motor_r_subtotal = [[(UIButton *)[_cell_10 viewWithTag:1] titleLabel] text]; //right subtotal
        dashboard.asia_motor_l_subtotal = [[(UIButton *)[_cell_10 viewWithTag:2] titleLabel] text]; //left subtotal
        dashboard.asia_motor_total = [[(UIButton *)[_cell_11 viewWithTag:3] titleLabel] text];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
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



#pragma mark - Custom Method
- (NSMutableArray *)setMotorData:(NSString *)str_motor {
    
    NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
    NSRange range = NSRangeFromString(str_motor);
    for (int i = 0; i < 10; i++) {
        range.location = i;
        range.length = 1;
        [arr_tmp addObject:[str_motor substringWithRange:range]];
    }
    
    return arr_tmp;
}

@end
