//
//  DeviceUseViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/10/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "DeviceUseViewController.h"
#import "Utility.h"
#import "KKDS_Preference.h" 


@interface DeviceUseViewController ()

@end

@implementation DeviceUseViewController

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
    
    if(_str_detailData == nil || [_str_detailData length] <= 0) {
        _str_detailData = @"000      ";
    }
    
    arr_detailData = [Utility getArrayFixationDataFromStrong:_str_detailData];

    
    sw_anterior = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
    [sw_anterior setOffText:@"NO"];
    [sw_anterior setOnText:@"YES"];
    [_CellAnterior addSubview:sw_anterior];
    [sw_anterior addTarget:self action:@selector(action_sw_anterior:) forControlEvents:UIControlEventValueChanged];
    
    
    sw_posterior = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
    [sw_posterior setOffText:@"NO"];
    [sw_posterior setOnText:@"YES"];
    [_CellPosterior addSubview:sw_posterior];
    [sw_posterior addTarget:self action:@selector(action_sw_posterior:) forControlEvents:UIControlEventValueChanged];
    
    sw_deviceLocation = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
    [sw_deviceLocation setOffText:@"NO"];
    [sw_deviceLocation setOnText:@"YES"];
    [_CellDeviceLocation addSubview:sw_deviceLocation];
    [sw_deviceLocation addTarget:self action:@selector(action_sw_deviceLocation:) forControlEvents:UIControlEventValueChanged];

}

- (void)viewWillAppear:(BOOL)animated {
    // set screen data
//    for(int i = 0; i < 10; i++) {
//        UIButton *btn_tmp = [arr_btn objectAtIndex:i];
//        if([[arr_detailData objectAtIndex:i] isEqualToString:@"0"]) {
//            // NO
//            [btn_tmp setTitle:@"" forState:UIControlStateNormal];
//        }
//        else {
//            //YES
//            [btn_tmp setTitle:@"X" forState:UIControlStateNormal];
//        }
//    }
    
    //--- set switch
    NSString *str_mis = [arr_detailData objectAtIndex:0];
    if([str_mis isEqualToString:@"1"]) [sw_anterior setOn:YES animated:NO ignoreControlEvents:YES];
    else [sw_anterior setOn:NO animated:NO ignoreControlEvents:YES];
    
    NSString *str_posterior = [arr_detailData objectAtIndex:1];
    if([str_posterior isEqualToString:@"1"]) [sw_posterior setOn:YES animated:NO ignoreControlEvents:YES];
    else [sw_posterior setOn:NO animated:NO ignoreControlEvents:YES];

    NSString *str_deviceLocation = [arr_detailData objectAtIndex:2];
    if([str_deviceLocation isEqualToString:@"1"]) [sw_deviceLocation setOn:YES animated:NO ignoreControlEvents:YES];
    else [sw_deviceLocation setOn:NO animated:NO ignoreControlEvents:YES];

    
    //--- set location
    NSString *str_locationLeft = [arr_detailData objectAtIndex:3];
    NSString *str_locationRight = [arr_detailData objectAtIndex:4];
    NSString *str_tmpLocation = [NSString stringWithFormat:@"%@ - %@", str_locationLeft, str_locationRight];
    [btn_location setTitle:str_tmpLocation forState:UIControlStateNormal];
}

- (void)action_sw_anterior:(id)sender {
    NSString *str_anterior = [arr_detailData objectAtIndex:0];
    if([str_anterior isEqualToString:@"1"])
        [arr_detailData replaceObjectAtIndex:0 withObject:@"0"];
    else
        [arr_detailData replaceObjectAtIndex:0 withObject:@"1"];
    [self viewWillAppear:NO];
}

- (void)action_sw_posterior:(id)sender {
    NSString *str_posterior = [arr_detailData objectAtIndex:1];
    if([str_posterior isEqualToString:@"1"])
        [arr_detailData replaceObjectAtIndex:1 withObject:@"0"];
    else
        [arr_detailData replaceObjectAtIndex:1 withObject:@"1"];
    [self viewWillAppear:NO];
}

- (void)action_sw_deviceLocation:(id)sender {
    NSString *str_deviceLocation = [arr_detailData objectAtIndex:2];
    if([str_deviceLocation isEqualToString:@"1"])
        [arr_detailData replaceObjectAtIndex:2 withObject:@"0"];
    else
        [arr_detailData replaceObjectAtIndex:2 withObject:@"1"];
    [self viewWillAppear:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
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
}

#pragma mark - custom method
- (IBAction)action_ok:(id)sender {
    //make return string data
    NSMutableString *str_return = [[NSMutableString alloc] init];
    
    for(NSString *str_tmp in arr_detailData) {
        [str_return appendString:str_tmp];
    }
    
    NSMutableArray *arr_return = [[NSMutableArray alloc] init];
    [arr_return addObject:str_return];
    [arr_return addObject:self.title];
    
    [_delegate performSelector:@selector(didFinishedDeviceUse:) withObject:arr_return];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)action_cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)action_btn_location:(id)sender {
    PickerViewController *pickerController = [[PickerViewController alloc] initWithNibName:@"PickerViewController" bundle:nil];
    pickerController.delegate = self;
    pickerController.arr_source0 = [[NSMutableArray alloc] initWithObjects:
                                    @"C2 ", @"C3 ", @"C4 ", @"C5 ", @"C6 ",
                                    @"C7 ", @"C8 ", @"T1 ", @"T2 ", @"T3 ",
                                    @"T4 ", @"T5 ", @"T6 ", @"T7 ", @"T8 ",
                                    @"T9 ", @"T10", @"T11", @"T12", @"L1 ",
                                    @"L2 ", @"L3 ", @"L4 ", @"L5 ", @"S1 ",
                                    @"S2 ", @"S3 ", @"S45", nil];
    pickerController.arr_source1 = [[NSMutableArray alloc] initWithObjects:
                                    @"C2 ", @"C3 ", @"C4 ", @"C5 ", @"C6 ",
                                    @"C7 ", @"C8 ", @"T1 ", @"T2 ", @"T3 ",
                                    @"T4 ", @"T5 ", @"T6 ", @"T7 ", @"T8 ",
                                    @"T9 ", @"T10", @"T11", @"T12", @"L1 ",
                                    @"L2 ", @"L3 ", @"L4 ", @"L5 ", @"S1 ",
                                    @"S2 ", @"S3 ", @"S45", nil];
    
    //    pickerController.lb_two_left.text = @"Left";
    //    pickerController.lb_two_right.text = @"Right";
    pickerController.lb_two_left.hidden = NO;
    pickerController.lb_two_right.hidden = NO;
    [self.navigationController pushViewController:pickerController animated:YES];
    
}

-(void)delegateConfirm:(NSMutableArray *)arr_selected {
    [arr_detailData replaceObjectAtIndex:3 withObject:[arr_selected objectAtIndex:0]]; //left
    [arr_detailData replaceObjectAtIndex:4 withObject:[arr_selected objectAtIndex:1]]; //right
    
    [self viewWillAppear:NO];
}

@end
