//
//  OnePickerViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "OnePickerViewController.h"
#import "Clipboard.h"

@interface OnePickerViewController ()

@end

@implementation OnePickerViewController

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
    // Do any additional setup after loading the view from its nib.
    // Do any additional setup after loading the view from its nib.
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];
    
    if([str_mode isEqualToString:@"duplicated"]) {
        [_v_picker selectRow:5 inComponent:0 animated:NO];
        [_v_picker selectRow:5 inComponent:1 animated:NO];
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UIPickerView delegate & data source
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if([str_mode isEqualToString:@"duplicated"]) {
        return 2;
    }
    else {
        return 1;
    }
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_arr_component_0 count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_arr_component_0 objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

- (void)setPickerViewData {
    //--- set default data ---//
}


#pragma mark - Custom Method

- (IBAction)confirm:(id)sender {
    if([self.title isEqualToString:@"Degrees Of Kyphosis"]) {
        dashboard.degree_kyphosis = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([self.title isEqualToString:@"Height Loss"]) {
        dashboard.height_loss = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([self.title isEqualToString:@"Translation"]) {
        dashboard.translation = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([self.title isEqualToString:@"ASIA Score"]) {
        dashboard.asia_score = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([self.title isEqualToString:@"Select Injury Type"] && [dashboard.neurologicallyintact isEqualToString:@"YES"]) {
        //--- Only intact == YES
        dashboard.injurytype = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([self.title isEqualToString:@"Motor"]) {
        [(NSMutableArray *)id_object1 replaceObjectAtIndex:selected_indexpath.row withObject:[_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]]];
        [(NSMutableArray *)id_object2 replaceObjectAtIndex:selected_indexpath.row withObject:[_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:1]]];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setMode:(NSString *)in_str_mode object1:(NSMutableArray *)object1 object2:(NSMutableArray *)object2 indexpath:(NSIndexPath *)in_indexpath {
    str_mode = in_str_mode;
    id_object1 = object1;
    id_object2 = object2;
    selected_indexpath = in_indexpath;
}

@end
