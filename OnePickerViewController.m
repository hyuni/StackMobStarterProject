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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UIPickerView delegate & data source
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
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
        dashboard.Translation = [_arr_component_0 objectAtIndex:[_v_picker selectedRowInComponent:0]];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
