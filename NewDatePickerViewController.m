//
//  NewDatePickerViewController.m
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "NewDatePickerViewController.h"

@interface NewDatePickerViewController ()

@end

@implementation NewDatePickerViewController

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
- (UIView *)getDatePickerView:(UIViewController *)viewController {
    //--- set outerViewController ---//
    outerViewController = viewController;
    self.delegate = viewController;
    
    CGRect tmpRect = self.view.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = viewController.view.frame.size.height;
    self.view.frame = tmpRect;
    return self.view;
}

- (void)moveUpPickerView {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
    
    CGRect tmpRect = self.view.frame;
    tmpRect.origin.x = 0;
    tmpRect.origin.y = outerViewController.view.frame.size.height - _view_inner.frame.size.height;
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
    
    [_delegate performSelector:@selector(delegateConfirm:) withObject:_datePicker.date];
}

@end
