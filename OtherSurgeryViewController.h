//
//  OtherSurgeryViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/10/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "DCRoundSwitch.h"

@interface OtherSurgeryViewController : UITableViewController {
    NSMutableArray* arr_menu;
    Dashboard* dashboard;
    
    DCRoundSwitch *sw_navigation;
}

@end
