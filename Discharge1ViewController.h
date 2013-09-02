//
//  Discharge1ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/1/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface Discharge1ViewController : UITableViewController {
    Dashboard *dashboard;
}
@property (weak, nonatomic) IBOutlet UITextField *tf_siteID;
@property (weak, nonatomic) IBOutlet UITextField *tf_healthcardNumber;
@property (weak, nonatomic) IBOutlet UILabel *lb_admission_date;
@property (weak, nonatomic) IBOutlet UILabel *lb_discharge_date;
@property (weak, nonatomic) IBOutlet UISwitch *sw_patient_receivedallogenic_blood;
@property (weak, nonatomic) IBOutlet UISwitch *sw_patient_admitted_to_icu;
@property (weak, nonatomic) IBOutlet UISwitch *sw_requires_step_down_bed;

@end
