//
//  IntakeForm4InjuryTypeViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "IntakeForm4InjuryTypeViewController.h"
#import "Clipboard.h"


@interface IntakeForm4InjuryTypeViewController ()

@end

@implementation IntakeForm4InjuryTypeViewController

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
    Clipboard *clip = [Clipboard sharedClipboard];
    dashboard = (Dashboard *)[clip clipKey:@"create_intake"];
    
    [self setPickerViewData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)setPickerViewData {
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
    
}


#pragma mark - Custom Method

- (IBAction)confirm:(id)sender {
    
    int i_selected_component_0 = [_v_picker selectedRowInComponent:0];
    int i_selected_component_1 = [_v_picker selectedRowInComponent:1];
    
    NSString *str_comp_0 = [arr_component_0 objectAtIndex:i_selected_component_0];
    NSString *str_comp_1 = [arr_component_1 objectAtIndex:i_selected_component_1];

    if(![dashboard.injurytype isEqualToString:str_comp_0]) {
        //--- if injurytype was changed, init data ---//
        dashboard.fracturetype = @"";
    }

    dashboard.injurytype = str_comp_0;
    dashboard.injurylevel = str_comp_1;
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
