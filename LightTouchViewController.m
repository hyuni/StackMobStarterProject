//
//  LightTouchViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "LightTouchViewController.h"
#import "Clipboard.h"
#import "OnePickerViewController.h"
#import "LightInfoViewController.h"

@interface LightTouchViewController ()

@end

@implementation LightTouchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
    
    //--- set data ---//
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];

    arr_asia_lighttouch_l = [self setStringData:dashboard.asia_lighttouch_l];
    arr_asia_lighttouch_r = [self setStringData:dashboard.asia_lighttouch_r];
    
    arr_asia_pinpric_l = [self setStringData:dashboard.asia_pinpric_l];
    arr_asia_pinpric_r = [self setStringData:dashboard.asia_pinpric_r];
    
    arr_row_title = [[NSMutableArray alloc] initWithObjects:
                     @"C2", @"C3", @"C4", @"C5", @"C6",
                     @"C7", @"C8", @"T1", @"T2", @"T3",
                     @"T4", @"T5", @"T6", @"T7", @"T8",
                     @"T9", @"T10", @"T11", @"T12", @"L1",
                     @"L2", @"L3", @"L4", @"L5", @"S1",
                     @"S2", @"S3", @"S4-5", nil];
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
	[infoButton addTarget:self action:@selector(infoButtonAction) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *modalButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
	[self.navigationItem setRightBarButtonItem:modalButton animated:YES];
    
}

- (void)infoButtonAction {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    LightInfoViewController *info = [storyboard instantiateViewControllerWithIdentifier:@"LightInfoViewController"];
    
 
    [info setInfoText:@"0  = Absent  \n1 = Impaired   \n2 = Normal   \nN = Not testable"];

    [self.navigationController pushViewController:info animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [_tableView reloadData];
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
    if(section == 0) return [arr_asia_lighttouch_l count] + 2;
    else return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSArray *topObject = nil;
    if(indexPath.section == 0) {
        if(indexPath.row < [arr_asia_lighttouch_l count]) {
            topObject = [[NSBundle mainBundle] loadNibNamed:@"LightTouchCell" owner:self options:nil];
            cell = [topObject objectAtIndex:0];
            
            //--- cell display
            // cell name
            UILabel *lb_title = (UILabel *)[cell viewWithTag:5];
            lb_title.text = [arr_row_title objectAtIndex:indexPath.row];
            
            UIButton *btn_light_l = (UIButton *)[cell viewWithTag:1];
            UIButton *btn_light_r = (UIButton *)[cell viewWithTag:2];
            UIButton *btn_pin_l = (UIButton *)[cell viewWithTag:3];
            UIButton *btn_pin_r = (UIButton *)[cell viewWithTag:4];
            
            // cell button value
            [btn_light_l setTitle:[arr_asia_lighttouch_l objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            [btn_light_r setTitle:[arr_asia_lighttouch_r objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            [btn_pin_l setTitle:[arr_asia_pinpric_l objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            [btn_pin_r setTitle:[arr_asia_pinpric_r objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            
            // button selector
            [btn_light_l addTarget:self action:@selector(action_btn_pressed:) forControlEvents:UIControlEventTouchUpInside];
            [btn_light_r addTarget:self action:@selector(action_btn_pressed:) forControlEvents:UIControlEventTouchUpInside];
            [btn_pin_l addTarget:self action:@selector(action_btn_pressed:) forControlEvents:UIControlEventTouchUpInside];
            [btn_pin_r addTarget:self action:@selector(action_btn_pressed:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        else if(indexPath.row == [arr_asia_lighttouch_l count]) {
            // subtotal
            topObject = [[NSBundle mainBundle] loadNibNamed:@"LightTouchCellSubtotal" owner:self options:nil];
            cell = [topObject objectAtIndex:0];
            cell.userInteractionEnabled = NO;
            
            UIButton *btn_light_l = (UIButton *)[cell viewWithTag:1];
            UIButton *btn_light_r = (UIButton *)[cell viewWithTag:2];
            UIButton *btn_pin_l = (UIButton *)[cell viewWithTag:3];
            UIButton *btn_pin_r = (UIButton *)[cell viewWithTag:4];
            
            i_light_subtotal_l = 0;
            i_light_subtotal_r = 0;
            i_pin_subtotal_l = 0;
            i_pin_subtotal_r = 0;
            
            for(NSString *str_curNum in arr_asia_lighttouch_l) {
                i_light_subtotal_l += [str_curNum intValue];
            }
            
            for(NSString *str_curNum in arr_asia_lighttouch_r) {
                i_light_subtotal_r += [str_curNum intValue];
            }

            for(NSString *str_curNum in arr_asia_pinpric_l) {
                i_pin_subtotal_l += [str_curNum intValue];
            }
            
            for(NSString *str_curNum in arr_asia_pinpric_r) {
                i_pin_subtotal_r += [str_curNum intValue];
            }
            
            [btn_light_l setTitle:[NSString stringWithFormat:@"%d", i_light_subtotal_l] forState:UIControlStateNormal];
            [btn_light_r setTitle:[NSString stringWithFormat:@"%d", i_light_subtotal_r] forState:UIControlStateNormal];
            [btn_pin_l setTitle:[NSString stringWithFormat:@"%d", i_pin_subtotal_l] forState:UIControlStateNormal];
            [btn_pin_r setTitle:[NSString stringWithFormat:@"%d", i_pin_subtotal_r] forState:UIControlStateNormal];
            
            // save for total
            i_light_total = i_light_subtotal_l + i_light_subtotal_r;
            i_pin_total = i_pin_subtotal_l + i_pin_subtotal_r;
            
            

        }
        else if(indexPath.row == [arr_asia_lighttouch_l count] + 1) {
            // total
            topObject = [[NSBundle mainBundle] loadNibNamed:@"LightTouchCellTotal" owner:self options:nil];
            cell = [topObject objectAtIndex:0];
            cell.userInteractionEnabled = NO;

            UIButton *btn_light_total = (UIButton *)[cell viewWithTag:1];
            UIButton *btn_pin_total = (UIButton *)[cell viewWithTag:3];
            [btn_light_total setTitle:[NSString stringWithFormat:@"%d", i_light_total] forState:UIControlStateNormal];
            [btn_pin_total setTitle:[NSString stringWithFormat:@"%d", i_pin_total] forState:UIControlStateNormal];
            
        }
        else {
            // error
        }
    }
    else {
        // confirm or error
        topObject = [[NSBundle mainBundle] loadNibNamed:@"ConfirmCell" owner:self options:nil];
        cell = [topObject objectAtIndex:0];
        
    }
    
    // Configure the cell...
    
    
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
        // data section - show image
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        LightInfoViewController *info = [storyboard instantiateViewControllerWithIdentifier:@"LightInfoViewController"];

        if(indexPath.row >= 0 && indexPath.row <= 2) {
            [info setImageName:@"Light_1"];
        }
        else if(indexPath.row >= 3 && indexPath.row <= 18) {
            [info setImageName:@"Light_2"];
        }
        else if(indexPath.row >= 19 && indexPath.row <= 24) {
            [info setImageName:@"Light_3"];
        }
        else if(indexPath.row >= 25 && indexPath.row <= 27) {
            [info setImageName:@"Light_4"];
        }
        
        [self.navigationController pushViewController:info animated:YES];
    }
    else {
        // confirm or error
        //data save & pop
        NSMutableString *mStr_light_l = [[NSMutableString alloc] init];
        NSMutableString *mStr_light_r = [[NSMutableString alloc] init];
        NSMutableString *mStr_pin_l = [[NSMutableString alloc] init];
        NSMutableString *mStr_pin_r = [[NSMutableString alloc] init];
        
        for(NSString *str_cur in arr_asia_lighttouch_l) {
            [mStr_light_l appendString:str_cur];
        }
        dashboard.asia_lighttouch_l = mStr_light_l;
        
        for(NSString *str_cur in arr_asia_lighttouch_r) {
            [mStr_light_r appendString:str_cur];
        }
        dashboard.asia_lighttouch_r = mStr_light_r;

        for(NSString *str_cur in arr_asia_pinpric_l) {
            [mStr_pin_l appendString:str_cur];
        }
        dashboard.asia_pinpric_l = mStr_pin_l;

        for(NSString *str_cur in arr_asia_pinpric_r) {
            [mStr_pin_r appendString:str_cur];
        }
        dashboard.asia_pinpric_r = mStr_pin_r;
        
        
        dashboard.asia_lighttouch_l_subtotal = [NSString stringWithFormat:@"%d", i_light_subtotal_l];
        dashboard.asia_lighttouch_r_subtotal = [NSString stringWithFormat:@"%d", i_light_subtotal_r];
        dashboard.asia_pinpric_l_subtotal = [NSString stringWithFormat:@"%d", i_pin_subtotal_l];
        dashboard.asia_pinpric_r_subtotal = [NSString stringWithFormat:@"%d", i_light_subtotal_r];
        dashboard.asia_lighttouch_total = [NSString stringWithFormat:@"%d", i_light_total];
        dashboard.asia_pinpric_total = [NSString stringWithFormat:@"%d", i_pin_total];

        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)action_btn_pressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    CGRect buttonFrame = [button convertRect:button.bounds toView:_tableView];
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint:buttonFrame.origin];
    
    OnePickerViewController *oneController = [[OnePickerViewController alloc] initWithNibName:@"OnePickerViewController" bundle:nil];
    NSMutableArray *component = [NSMutableArray arrayWithObjects:@"0", @"1", @"2", @"N", nil];
    oneController.title = @"Light Touch / Pin Prick";
    oneController.arr_component_0 = component;

    //--- set data array
    int i_tag = button.tag;

    NSMutableArray *arr_tmp;
    switch (i_tag) {
        case 1:
            arr_tmp = arr_asia_lighttouch_l;
            break;
        case 2:
            arr_tmp = arr_asia_lighttouch_r;
            break;
        case 3:
            arr_tmp = arr_asia_pinpric_l;
            break;
        case 4:
            arr_tmp = arr_asia_pinpric_r;
            break;
            
        default:
            break;
    }

    [oneController setMode:@"Light Touch / Pin Prick" object1:arr_tmp object2:nil indexpath:indexPath];
    [self.navigationController pushViewController:oneController animated:YES];
}

#pragma mark - Custom Method
- (NSMutableArray *)setStringData:(NSString *)str_data {
    
    NSMutableArray *arr_tmp = [[NSMutableArray alloc] init];
    NSRange range = NSRangeFromString(str_data);
    for (int i = 0; i < [str_data length]; i++) {
        range.location = i;
        range.length = 1;
        [arr_tmp addObject:[str_data substringWithRange:range]];
    }
    
    return arr_tmp;
}

@end
