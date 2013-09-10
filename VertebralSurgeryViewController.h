//
//  VertebralSurgeryViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/9/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "DetailViewController.h"

@interface VertebralSurgeryViewController : UITableViewController<DetailViewControllerDelegate> {
    NSMutableArray *arr_menu;
    
    Dashboard *dashboard;
}

@end
