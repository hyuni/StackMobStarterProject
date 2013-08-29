//
//  IntakeForm4ViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "IntakeForm4ViewController.h"

@interface IntakeForm4ViewController ()

@end

@implementation IntakeForm4ViewController

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
    
    
    
    [self setPickerView];
    
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
}

- (void)dismissKeyboard {
    [self moveDownPickerView];
    [self.view removeGestureRecognizer:tap];
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
    if(indexPath.section == 0 && indexPath.row == 0) {
        [self moveDownPickerView];
        
    }
    else if(indexPath.section == 0 && indexPath.row == 1) {
        //--- injury type ---//
        if(_sw_intact.isOn == NO) {
            
        }
        else if(_sw_intact.isOn == YES) {
            
        }
        
        
        [self moveUpPickerView];
    }
}

#pragma UIPickerView delegate & data source
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component == 0) return [arr_component_0 count];
    else if(component == 1) {
        return i_component_1_row;
    }
    else return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component == 0) return [arr_component_0 objectAtIndex:row];
    else if(component == 1) return [arr_component_1 objectAtIndex:row];
    else return @"error";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if(component == 0) {
        if(row == 0) i_component_1_row = 12;
        else if(row == 1) i_component_1_row = 5;
        else if(row == 2) i_component_1_row = 7;
        else i_component_1_row = 0;
        
        [pickerView reloadAllComponents];
    }
}

#pragma mark - pickerview control
- (void)setPickerView {
    //--- set default data ---//
    arr_component_0 = [[NSMutableArray alloc] init];
    arr_component_1 = [[NSMutableArray alloc] init];
    
    [arr_component_0 addObject:@"Thoracic"];
    [arr_component_0 addObject:@"Lumbar"];
    [arr_component_0 addObject:@"Cervical"];
    
    [arr_component_1 addObject:@"1"];
    [arr_component_1 addObject:@"2"];
    [arr_component_1 addObject:@"3"];
    [arr_component_1 addObject:@"4"];
    [arr_component_1 addObject:@"5"];
    [arr_component_1 addObject:@"6"];
    [arr_component_1 addObject:@"7"];
    [arr_component_1 addObject:@"8"];
    [arr_component_1 addObject:@"9"];
    [arr_component_1 addObject:@"10"];
    [arr_component_1 addObject:@"11"];
    [arr_component_1 addObject:@"12"];
    
    i_component_1_row = [arr_component_1 count];
    
    //--- set PickerView ---//
    pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    
    CGRect tmpRect = pickerView.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = self.view.frame.size.height;
    pickerView.frame = tmpRect;
    
//    [pickerView selectRow:1 inComponent:0 animated:YES];
//    [pickerView selectRow:1 inComponent:1 animated:YES];
    
    [self.view addSubview:pickerView];
}


- (void)initData {
    
    
}


- (void)moveUpPickerView {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
    
    CGRect tmpRect = pickerView.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = self.view.frame.size.height - pickerView.frame.size.height;
    pickerView.frame = tmpRect;
    
    [UIView commitAnimations];
    
    [self.view addGestureRecognizer:tap];
}

- (void)moveDownPickerView {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
    
    CGRect tmpRect = pickerView.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = self.view.frame.size.height;
    pickerView.frame = tmpRect;
    
    [UIView commitAnimations];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
