//
//  DetailViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/9/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "DetailViewController.h"
#import "Clipboard.h"
#import "Utility.h"
#import "KKDS_Preference.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
        _str_detailData = @"000000000000      ";
    }
    
    arr_detailData = [Utility getArrayDataFromStrong:_str_detailData];
    arr_btn = [[NSMutableArray alloc] initWithObjects:btn_1, btn_2, btn_3, btn_4, btn_5, btn_6, btn_7, btn_8, btn_9, btn_10, nil];
    
    for(UIButton *btn_tmp in arr_btn) {
        [btn_tmp addTarget:self action:@selector(action_btn_pressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    sw_mis = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
    [sw_mis setOffText:@"NO"];
    [sw_mis setOnText:@"YES"];
    [cell_mis addSubview:sw_mis];
    [sw_mis addTarget:self action:@selector(action_sw_mis:) forControlEvents:UIControlEventValueChanged];
    
    sw_revision = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(DCSwitch_Origin_X, DCSwitch_Origin_Y, DCSwitch_SIZE_WIDTH, DCSwitch_SIZE_HEIGHT)];
    [sw_revision setOffText:@"NO"];
    [sw_revision setOnText:@"YES"];
    [cell_revision addSubview:sw_revision];
    [sw_revision addTarget:self action:@selector(action_sw_revision:) forControlEvents:UIControlEventValueChanged];



}



- (void)action_sw_mis:(id)sender {
    NSString *str_mis = [arr_detailData objectAtIndex:10];
    if([str_mis isEqualToString:@"1"]) [arr_detailData replaceObjectAtIndex:10 withObject:@"0"];
    else [arr_detailData replaceObjectAtIndex:10 withObject:@"1"];
    [self viewWillAppear:NO];
}

- (void)action_sw_revision:(id)sender {
    NSString *str_revision = [arr_detailData objectAtIndex:11];
    if([str_revision isEqualToString:@"1"]) [arr_detailData replaceObjectAtIndex:11 withObject:@"0"];
    else [arr_detailData replaceObjectAtIndex:11 withObject:@"1"];
    [self viewWillAppear:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    // set screen data
    for(int i = 0; i < 10; i++) {
        UIButton *btn_tmp = [arr_btn objectAtIndex:i];
        if([[arr_detailData objectAtIndex:i] isEqualToString:@"0"]) {
            // NO
            [btn_tmp setTitle:@"" forState:UIControlStateNormal];
        }
        else {
            //YES
            [btn_tmp setTitle:@"X" forState:UIControlStateNormal];
        }
    }
    
    //--- set switch
    NSString *str_mis = [arr_detailData objectAtIndex:10];
    if([str_mis isEqualToString:@"1"]) [sw_mis setOn:YES animated:NO ignoreControlEvents:YES];
    else [sw_mis setOn:NO animated:NO ignoreControlEvents:YES];
    
    NSString *str_revision = [arr_detailData objectAtIndex:11];
    if([str_revision isEqualToString:@"1"]) [sw_revision setOn:YES animated:NO ignoreControlEvents:YES];
    else [sw_revision setOn:NO animated:NO ignoreControlEvents:YES];
    
    //--- set location
    NSString *str_locationLeft = [arr_detailData objectAtIndex:12];
    NSString *str_locationRight = [arr_detailData objectAtIndex:13];
    NSString *str_tmpLocation = [NSString stringWithFormat:@"%@ - %@", str_locationLeft, str_locationRight];
    [btn_location setTitle:str_tmpLocation forState:UIControlStateNormal];
}

- (void)action_btn_pressed:(id)sender {
    UIButton *btn_tmp = (UIButton *)sender;
    int i_btnTag = btn_tmp.tag;
    int i_btnNum = i_btnTag - 10;

    NSString *str_data = [arr_detailData objectAtIndex:i_btnNum];
    
    if([str_data isEqualToString:@"0"]) {
        [arr_detailData replaceObjectAtIndex:i_btnNum withObject:@"1"];
    }
    else {
        [arr_detailData replaceObjectAtIndex:i_btnNum withObject:@"0"];
    }
    
    [self viewWillAppear:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - custom method
- (IBAction)action_info:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    LightInfoViewController *info = [storyboard instantiateViewControllerWithIdentifier:@"LightInfoViewController"];
    
    info.title = @"Info";
    
    [info setInfoText:@"Anterior \n1 - Transoral \n2 - Subaxial cervical spine \n3- Sternal split \n4 - Thoracotomy \n5 - Thoracoabdominal \n6 - Transperitoneal \n7 - Retroperitoneal \n\nPosterior \n8 - Midline \n9 - Paraspinal \n10 - Lateral"];
    
    [self.navigationController pushViewController:info animated:YES];

}

- (IBAction)action_ok:(id)sender {
    //make return string data
    NSMutableString *str_return = [[NSMutableString alloc] init];
    
    for(NSString *str_tmp in arr_detailData) {
        [str_return appendString:str_tmp];
    }
    
    NSMutableArray *arr_return = [[NSMutableArray alloc] init];
    [arr_return addObject:str_return];
    [arr_return addObject:self.title];
    
    [_delegate performSelector:@selector(delegateOk:) withObject:arr_return];
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
    pickerController.title = @"Location";
    [self.navigationController pushViewController:pickerController animated:YES];

}

-(void)delegateConfirm:(NSMutableArray *)arr_selected {
    [arr_detailData replaceObjectAtIndex:12 withObject:[arr_selected objectAtIndex:0]]; //left
    [arr_detailData replaceObjectAtIndex:13 withObject:[arr_selected objectAtIndex:1]]; //right
    
    [self viewWillAppear:NO];
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

- (void)setLabelTitle:(NSString *)title subTitle:(NSString *)subTitle {
    if(title != nil) {
        lb_title.text = title;
    }
    
    if(subTitle != nil) {
        lb_subTitle.text = subTitle;
    }
}
@end
