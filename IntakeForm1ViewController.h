//
//  IntakeForm1ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/28/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "NewDatePickerViewController.h"

@interface IntakeForm1ViewController : UITableViewController<UITextFieldDelegate, NewDatePcikerViewControllerDelegate> {
        NewDatePickerViewController *datePickerViewController;
        UIView *datePickerView;
    Dashboard *dashboard;
}

@property (strong, nonatomic) IBOutlet UIView *modalView;
@property (weak, nonatomic) IBOutlet UITextField *tf_healthCardNumber;
@property (weak, nonatomic) IBOutlet UILabel *lb_dataOfBirth;
@property (weak, nonatomic) IBOutlet UIDatePicker *dp_dateOfBirth;


- (IBAction)save_local:(id)sender;
- (IBAction)cancel_local:(id)sender;



@end
