//
//  IntakeForm5ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/31/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "NewDatePickerViewController.h"

@interface IntakeForm5ViewController : UITableViewController<UITextFieldDelegate, NewDatePcikerViewControllerDelegate> {
    NSMutableArray *arr_menu;
    Dashboard *dashboard;
    UIStoryboard *storyboard;
    
    int _initialTVHeight;
    
    NewDatePickerViewController *datePickerViewController;
    UIView *datePickerView;
    
}


- (IBAction)billing_code_done:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lb_dateOfSurgery;


@end

