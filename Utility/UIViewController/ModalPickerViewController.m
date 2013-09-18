//
//  ModalPickerViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 9/11/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "ModalPickerViewController.h"

@interface ModalPickerViewController ()

@end

@implementation ModalPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if(_arr_sources == nil)
            _arr_sources = [[NSMutableArray alloc] init];
        if(_tag == nil)
            _tag = @"";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    switch (_modalMode) {
        case ModalPickerViewModePikcer:
            pv_datePicker.hidden = YES;
            pv_picker.hidden = NO;
            break;
        case ModalPickerViewModeDatePicker:
            pv_datePicker.hidden = NO;
            pv_picker.hidden = YES;
            break;
        case ModalPickerViewModeDateTimePicker:
            pv_datePicker.hidden = NO;
            pv_picker.hidden = YES;
            break;
        default:
            break;
    }
    
    lb_title.text = str_lbTitle;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Method
- (void)setToolbarTitle:(NSString *)pString {
    str_lbTitle = pString;
}

- (IBAction)didPressedCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didPressedConfirm:(id)sender {
    NSMutableArray *arr_selectedItems = [[NSMutableArray alloc] init];
    if(_modalMode == ModalPickerViewModePikcer) {
        for(int i = 0; i < [_arr_sources count]; i++) {
            int i_rowSelected = [pv_picker selectedRowInComponent:i];
            [arr_selectedItems addObject:[[_arr_sources objectAtIndex:i] objectAtIndex:i_rowSelected]];
        }
    }
    else if(_modalMode == ModalPickerViewModeDatePicker) {
        [arr_selectedItems addObject:pv_datePicker.date];
    }

    [_delegate performSelector:@selector(didFinishedModalPickerConfirmed:tag:) withObject:arr_selectedItems withObject:_tag];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIPickerView
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return [_arr_sources count];
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[_arr_sources objectAtIndex:component] count];

}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[_arr_sources objectAtIndex:component] objectAtIndex:row];
}

@end
