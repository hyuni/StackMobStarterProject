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

@interface Surgery1ViewController : UITableViewController<PickerViewControllerDelegate> {
    NSMutableArray *arr_menu0;
    NSMutableArray *arr_menu1;
    Dashboard *dashboard;
    
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



@end
