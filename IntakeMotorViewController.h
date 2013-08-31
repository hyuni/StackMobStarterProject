//
//  IntakeMotorViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface IntakeMotorViewController : UITableViewController {
    NSMutableArray *arr_cells;
    Dashboard *dashboard;
    
    NSMutableArray *arr_asia_motor_r;
    NSMutableArray *arr_asia_motor_l;
    
    int i_total;

}

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_4;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_5;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_6;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_7;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_8;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_9;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_10; //sub total
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_11; //total


@property (weak, nonatomic) IBOutlet UITableViewCell *cell_confirm;

@end
