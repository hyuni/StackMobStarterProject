//
//  TLICScoreViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface TLICScoreViewController : UITableViewController {
    
    Dashboard *dashboard;
    NSMutableArray *arr_sections;

    UITableViewCell *cell_section_1; //Fracture morphology
    UITableViewCell *cell_section_2; //Neurologic status
    UITableViewCell *cell_section_3; //PLC
}

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *arr_section_0;
@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *arr_section_1;
@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *arr_section_2;




@end
