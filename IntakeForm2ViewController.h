//
//  IntakeForm2ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/28/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "NewDatePickerViewController.h"

@interface IntakeForm2ViewController : UITableViewController<NewDatePcikerViewControllerDelegate> {
    UIView *datePickerView;
    NewDatePickerViewController *datePickerViewController;

    Dashboard *dashboard;
}

@property (weak, nonatomic) IBOutlet UILabel *lb_date;
@property (weak, nonatomic) IBOutlet UITextField *tf_visitType;
@property (weak, nonatomic) IBOutlet UITextField *tf_billingCode;

- (IBAction)save_local:(id)sender;
- (IBAction)cancel_local:(id)sender;


@end
