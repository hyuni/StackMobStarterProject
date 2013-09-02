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
    else if([str_mode isEqualToString:@"Light Touch / Pin Prick"]) {
        [_v_picker selectRow:2 inComponent:0 animated:NO];
    }

    UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)];
    self.navigationItem.rightBarButtonItem = confirmButton;
    
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
    else if([self.title isEqualToString:@"Adverse event extended visit by"]) {
        //Adverse event extended visit by
        //create_discharge
        Clipboard *clip = [Clipboard sharedClipboard];
        Dashboard *tmpDash = [clip clipKey:@"create_discharge"];
        tmpDash.event_days = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([self.title isEqualToString:@"Peri-operative Adverse Events"]) {
        //Adverse event extended visit by
        //create_discharge
        Clipboard *clip = [Clipboard sharedClipboard];
        Dashboard *dashboard = [clip clipKey:@"create_discharge"];

        NSString *str_tmp = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
        
        switch (selected_indexpath.row) {
            case 0:
                dashboard.event_0 = str_tmp;
                break;
            case 1:
                dashboard.event_1 = str_tmp;
                break;
            case 2:
                dashboard.event_2 = str_tmp;
                break;
            case 3:
                dashboard.event_3 = str_tmp;
                break;
            case 4:
                dashboard.event_4 = str_tmp;
                break;
            case 5:
                dashboard.event_5 = str_tmp;
                break;
            case 6:
                dashboard.event_6 = str_tmp;
                break;
            case 7:
                dashboard.event_7 = str_tmp;
                break;
            case 8:
                dashboard.event_8 = str_tmp;
                break;
            case 9:
                dashboard.event_9 = str_tmp;
                break;
            case 10:
                dashboard.event_10 = str_tmp;
                break;
            case 11:
                dashboard.event_11 = str_tmp;
                break;
            case 12:
                dashboard.event_12 = str_tmp;
                break;
            case 13:
                dashboard.event_13 = str_tmp;
                break;
            case 14:
                dashboard.event_14 = str_tmp;
                break;
            case 15:
                dashboard.event_15 = str_tmp;
                break;
            case 16:
                dashboard.event_16 = str_tmp;
                break;
            case 17:
                dashboard.event_17 = str_tmp;
                break;
            case 18:
                dashboard.event_18 = str_tmp;
                break;
            case 19:
                dashboard.event_19 = str_tmp;
                break;
            case 20:
                dashboard.event_20 = str_tmp;
                break;
            case 21:
                dashboard.event_21 = str_tmp;
                break;
            case 22:
                dashboard.event_22 = str_tmp;
                break;
            case 23:
                dashboard.event_23 = str_tmp;
                break;
                
            default:
                break;
        }
        
        
    }
    
    //--- duplicated mode == Motor
    else if([self.title isEqualToString:@"Motor"]) {
        [(NSMutableArray *)id_object1 replaceObjectAtIndex:selected_indexpath.row withObject:[_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]]];
        [(NSMutableArray *)id_object2 replaceObjectAtIndex:selected_indexpath.row withObject:[_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:1]]];
    }
    //--- compare mode, not title!
    else if([str_mode isEqualToString:@"Light Touch / Pin Prick"]) {
        [(NSMutableArray *)id_object1 replaceObjectAtIndex:selected_indexpath.row withObject:[_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]]];
    }
    else if([str_mode isEqualToString:@"n_sensory_r"]) {
        ((Dashboard *)id_object1).n_sensory_r = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([str_mode isEqualToString:@"n_sensory_l"]) {
        ((Dashboard *)id_object1).n_sensory_l = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([str_mode isEqualToString:@"n_motor_r"]) {
        ((Dashboard *)id_object1).n_motor_r = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([str_mode isEqualToString:@"n_motor_l"]) {
        ((Dashboard *)id_object1).n_motor_l = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([str_mode isEqualToString:@"z_sensory_r"]) {
        ((Dashboard *)id_object1).z_sensory_r = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([str_mode isEqualToString:@"z_sensory_l"]) {
        ((Dashboard *)id_object1).z_sensory_l = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([str_mode isEqualToString:@"z_motor_r"]) {
        ((Dashboard *)id_object1).z_motor_r = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([str_mode isEqualToString:@"z_motor_l"]) {
        ((Dashboard *)id_object1).z_motor_l = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    else if([str_mode isEqualToString:@"OnlyOneMode"]) {

    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setMode:(NSString *)in_str_mode object1:(id)object1 object2:(id)object2 indexpath:(NSIndexPath *)in_indexpath {
    str_mode = in_str_mode;
    id_object1 = object1;
    id_object2 = object2;
    selected_indexpath = in_indexpath;
}

@end
