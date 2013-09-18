//
//  Surgery1ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/7/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "PickerViewController.h"
#import "VertebralSurgeryViewController.h"
#import "AdjunctiveViewController.h"
#import "OtherSurgeryViewController.h"
#import "ModalPickerViewController.h"
#import "StackMob.h"
#import "Utility.h"
#import "DatePickerViewController.h"
#import "DCRoundSwitch.h"
#import "KKDS_Preference.h"
#import "AdverseEventViewController.h"
#import "Clipboard.h"


@interface Surgery1ViewController : UITableViewController<ModalPickerViewDelegate, UITextFieldDelegate> {
    NSMutableArray *arr_menu0;
    NSMutableArray *arr_menu1;
    
    
    UILabel *lb_startTime;
    UILabel *lb_endTime;
    
    UITextField *tf_siteId;
    UITextField *tf_healthcard;
    UITextField *tf_estimatedBloodLoss;
    UITextField *tf_timeCompression;
    
    UIButton *btn_section2_0;
    UIButton *btn_section2_1;
    UIButton *btn_section2_2;
    UIButton *btn_section2_3;
    
    
    NSString *str_asoScore;
    
}

@property NSDate *dt_start;
@property NSDate *dt_end;

@property Dashboard *dashboard;

- (IBAction)cancel_local:(id)sender;
- (IBAction)save_local:(id)sender;


@end
