//
//  AdverseEventViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/9/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "AdverseEventViewController.h"
#import "Clipboard.h"


@interface AdverseEventViewController ()

@end

@implementation AdverseEventViewController

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
//    self.tableView.contentSize = CGSizeMake(100, 100);
//    self.tableView.frame = CGRectMake(0, 0, 100, 100);
//    self.view.frame = CGRectMake(0, 0, 100, 100);
//    [self.tableView sizeToFit];
    
    Clipboard *clip = [Clipboard sharedClipboard];
    _dashboard = [clip clipKey:@"create_surgery"];
    
//    str_intra_0 = @"";
//    str_intra_1 = @"";
//    str_intra_2 = @"";
//    str_intra_3 = @"";
//    str_intra_4 = @"";
//    str_intra_5 = @"";
//    str_intra_6 = @"";
//    str_intra_7 = @"";
//    str_intra_8 = @"";
//    str_intra_9 = @"";
//    str_intra_10 = @"";
//    str_intra_11 = @"";
//    str_intra_12 = @"";
//    str_intra_13 = @"";
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    _dashboard.intra_0 = str_intra_0;
//    _dashboard.intra_1 = str_intra_1;
//    _dashboard.intra_2 = str_intra_2;
//    _dashboard.intra_3 = str_intra_3;
//    _dashboard.intra_4 = str_intra_4;
//    _dashboard.intra_5 = str_intra_5;
//    _dashboard.intra_6 = str_intra_6;
//    _dashboard.intra_7 = str_intra_7;
//    _dashboard.intra_8 = str_intra_8;
//    _dashboard.intra_9 = str_intra_9;
//    _dashboard.intra_10 = str_intra_10;
//    _dashboard.intra_11 = str_intra_11;
//    _dashboard.intra_12 = str_intra_12;
//    _dashboard.intra_13 = str_intra_13;
    
    arr_intra_bool = [[NSMutableArray alloc] initWithObjects:_dashboard.intra_bool_0, _dashboard.intra_bool_1, _dashboard.intra_bool_2, _dashboard.intra_bool_3, _dashboard.intra_bool_4, _dashboard.intra_bool_5, _dashboard.intra_bool_6, _dashboard.intra_bool_7, _dashboard.intra_bool_8, _dashboard.intra_bool_9, _dashboard.intra_bool_10, _dashboard.intra_bool_11, _dashboard.intra_bool_12, _dashboard.intra_bool_13, nil];
    
    arr_intra = [[NSMutableArray alloc] initWithObjects:_dashboard.intra_0, _dashboard.intra_1, _dashboard.intra_2, _dashboard.intra_3, _dashboard.intra_4, _dashboard.intra_5, _dashboard.intra_6, _dashboard.intra_7, _dashboard.intra_8, _dashboard.intra_9, _dashboard.intra_10, _dashboard.intra_11, _dashboard.intra_12, _dashboard.intra_13, nil];

    
    arr_menu = [[NSMutableArray alloc] init];
    [arr_menu addObject:@"Airway / Ventilation"];
    [arr_menu addObject:@"Allergic reaction"];
    [arr_menu addObject:@"Cardiac arrest / failure / arrhthmia"];
    [arr_menu addObject:@"Cutaneous injury"];
    [arr_menu addObject:@"Dural tear"];
    [arr_menu addObject:@"Hypotension"];
    [arr_menu addObject:@"Implant / instrument related"];
    [arr_menu addObject:@"Incorrect operative site"];
    [arr_menu addObject:@"Instrumentation / Fixation / implant / or maipositioning requiring revision"];
    [arr_menu addObject:@"Massive blood loss"];
    [arr_menu addObject:@"Neural injury spinal cord"];
    [arr_menu addObject:@"Neural injury nerve root"];
    [arr_menu addObject:@"Vascular injury"];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arr_menu count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Other"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellOther"];
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1Label"];
    }
    
    return cell.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     [arr_menu addObject:@"Airway / Ventilation"];
     [arr_menu addObject:@"Allergic reaction"];
     [arr_menu addObject:@"Cardiac arrest / failure / arrhthmia"];
     [arr_menu addObject:@"Cutaneous injury"];
     [arr_menu addObject:@"Dural tear"];
     [arr_menu addObject:@"Hypotension"];
     [arr_menu addObject:@"Implant / instrument related"];
     [arr_menu addObject:@"Incorrect operative site"];
     [arr_menu addObject:@"Instrumentation / Fixation / implant / or maipositioning requiring revision"];
     [arr_menu addObject:@"Massive blood loss"];
     [arr_menu addObject:@"Neural injury spinal cord"];
     [arr_menu addObject:@"Neural injury nerve root"];
     [arr_menu addObject:@"Vascular injury"];
     [arr_menu addObject:@"Other"];
     */

    UITableViewCell *cell = nil;
    
    if([[arr_menu objectAtIndex:indexPath.row] isEqualToString:@"Other"]) {
        // intra 13 + 14
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellOther"];
        UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
        lb_title.text = [arr_menu objectAtIndex:indexPath.row];
        
        tv_other = (UITextView *)[cell viewWithTag:4];
        tv_other.text = _dashboard.intra_14;

    }
    else {
        // intra 0~13
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1Label"];
        UILabel *lb_title = (UILabel *)[cell viewWithTag:1];
        lb_title.text = [arr_menu objectAtIndex:indexPath.row];
        
    }
    
    UIButton *btn_yes = (UIButton *)[cell viewWithTag:2];
    [btn_yes setTitle:[arr_intra_bool objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [btn_yes addTarget:self action:@selector(action_btn_yes:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn_grade = (UIButton *)[cell viewWithTag:3];
    [btn_grade setTitle:[arr_intra objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [btn_grade addTarget:self action:@selector(action_btn_grade:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Configure the cell...
    
    return cell;
}

- (void)textViewDidChange:(UITextView *)textView {
    _dashboard.intra_14 = tv_other.text;
}

- (void)action_btn_yes:(id)sender {
    CGPoint buttonOriginInTableView = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonOriginInTableView];
    
    
    NSString *str_tmp = [arr_intra_bool objectAtIndex:indexPath.row];
    str_tmp = ([str_tmp isEqualToString:@"YES"] ? @"NO" : @"YES");
    
    switch (indexPath.row) {
        case 0:
            _dashboard.intra_bool_0 = str_tmp;
            break;
        case 1:
            _dashboard.intra_bool_1 = str_tmp;
            break;
        case 2:
            _dashboard.intra_bool_2 = str_tmp;
            break;
        case 3:
            _dashboard.intra_bool_3 = str_tmp;
            break;
        case 4:
            _dashboard.intra_bool_4 = str_tmp;
            break;
        case 5:
            _dashboard.intra_bool_5 = str_tmp;
            break;
        case 6:
            _dashboard.intra_bool_6 = str_tmp;
            break;
        case 7:
            _dashboard.intra_bool_7 = str_tmp;
            break;
        case 8:
            _dashboard.intra_bool_8 = str_tmp;
            break;
        case 9:
            _dashboard.intra_bool_9 = str_tmp;
            break;
        case 10:
            _dashboard.intra_bool_10 = str_tmp;
            break;
        case 11:
            _dashboard.intra_bool_11 = str_tmp;
            break;
        case 12:
            _dashboard.intra_bool_12 = str_tmp;
            break;
        case 13:
            _dashboard.intra_bool_13 = str_tmp;
            break;
            
        default:
            break;
    }
    
    [self viewWillAppear:NO];

}

- (void)action_btn_grade:(id)sender {
    CGPoint buttonOriginInTableView = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonOriginInTableView];
    
    if(![[arr_intra_bool objectAtIndex:indexPath.row] isEqualToString:@"YES"]) {
        return;
    }
    
    i_curIndex = indexPath.row;

    PickerViewController *pickerController = [[PickerViewController alloc] initWithNibName:@"PickerViewController" bundle:nil];
    pickerController.delegate = self;
    pickerController.arr_source0 = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", nil];
    
    [self.navigationController pushViewController:pickerController animated:YES];

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

#pragma mark - PickerViewDelegate
-(void)delegateConfirm:(NSMutableArray *)arr_selected {

    switch (i_curIndex) {
        case 0:
            _dashboard.intra_0 = [arr_selected objectAtIndex:0];
            break;
        case 1:
            _dashboard.intra_1 = [arr_selected objectAtIndex:0];
            break;
        case 2:
            _dashboard.intra_2 = [arr_selected objectAtIndex:0];
            break;
        case 3:
            _dashboard.intra_3 = [arr_selected objectAtIndex:0];
            break;
        case 4:
            _dashboard.intra_4 = [arr_selected objectAtIndex:0];
            break;
        case 5:
            _dashboard.intra_5 = [arr_selected objectAtIndex:0];
            break;
        case 6:
            _dashboard.intra_6 = [arr_selected objectAtIndex:0];
            break;
        case 7:
            _dashboard.intra_7 = [arr_selected objectAtIndex:0];
            break;
        case 8:
            _dashboard.intra_8 = [arr_selected objectAtIndex:0];
            break;
        case 9:
            _dashboard.intra_9 = [arr_selected objectAtIndex:0];
            break;
        case 10:
            _dashboard.intra_10 = [arr_selected objectAtIndex:0];
            break;
        case 11:
            _dashboard.intra_11 = [arr_selected objectAtIndex:0];
            break;
        case 12:
            _dashboard.intra_12 = [arr_selected objectAtIndex:0];
            break;
        case 13:
            _dashboard.intra_13 = [arr_selected objectAtIndex:0];
            break;
            
        default:
            break;
    }

}

@end
