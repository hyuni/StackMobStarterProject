//
//  PickerViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/9/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

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
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)];
    self.navigationItem.rightBarButtonItem = confirmButton;

    arr_source = [[NSMutableArray alloc] init];
    if(_arr_source0 != nil)
        [arr_source addObject:_arr_source0];
    if(_arr_source1 != nil)
        [arr_source addObject:_arr_source1];
    if(_arr_source2 != nil)
        [arr_source addObject:_arr_source2];
    
    if(_arr_source0 != nil && _arr_source1 != nil) {
        _lb_two_left.hidden = NO;
        _lb_two_right.hidden = NO;
    }
    
    _lb_title.text = _str_title;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UIPickerView delegate & data source
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return [arr_source count];
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[arr_source objectAtIndex:component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[arr_source objectAtIndex:component] objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

#pragma mark - Custom Method

- (void)confirm:(id)sender {
    
    NSMutableArray *arr_selected = [[NSMutableArray alloc] init];
    
    if (_arr_source0 != nil) {
        [arr_selected addObject:[_arr_source0 objectAtIndex:[_pickerView selectedRowInComponent:0]]];
    }
    
    if (_arr_source1 != nil) {
        [arr_selected addObject:[_arr_source1 objectAtIndex:[_pickerView selectedRowInComponent:1]]];
    }
    
    if (_arr_source2 != nil) {
        [arr_selected addObject:[_arr_source2 objectAtIndex:[_pickerView selectedRowInComponent:2]]];
    }

    [_delegate performSelector:@selector(delegateConfirm:) withObject:arr_selected];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
