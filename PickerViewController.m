//
//  PickerViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Method
- (void)setPickerView:(UIViewController *)viewController {
    //--- set outerViewController ---//
    outerViewController = viewController;
    self.delegate = viewController;
    
    CGRect tmpRect = self.view.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = viewController.view.frame.size.height;
    tmpRect.size.height = _toolbar.frame.size.height*2 + _picker.frame.size.height;
    self.view.frame = tmpRect;
    
    [outerViewController.view addSubview:self.view];
}

- (void)moveUpPickerView {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
    
    CGRect tmpRect = self.view.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = outerViewController.view.frame.size.height - self.view.frame.size.height;
    self.view.frame = tmpRect;
    
    [UIView commitAnimations];
}

- (IBAction)moveDownPickerView:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
    
    CGRect tmpRect = self.view.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = outerViewController.view.frame.size.height;
    self.view.frame = tmpRect;
    
    [UIView commitAnimations];
    
    //--- set result here ---//
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    [_delegate performSelector:@selector(delegateConfirm:) withObject:result];
}

#pragma mark - UIPickerView delegate & data source
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if(_arr_pickerData == nil)
        return 0;
    
    return [_arr_pickerData count];
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(_arr_pickerData == nil)
        return 0;
    
    return [[_arr_pickerData objectAtIndex:component] count];

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[_arr_pickerData objectAtIndex:component] objectAtIndex:row];
}

//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0); // attributed title is favored if both methods are implemented
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}


@end
