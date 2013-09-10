//
//  DeviceUsedViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/10/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "Clipboard.h"   
#import "DeviceUseViewController.h"

@interface DeviceUsedViewController : UITableViewController<UITextViewDelegate, DeviceUseViewControllerDelegate> {
    Dashboard *dashboard;
    
    NSMutableArray *arr_menu_bool;
    NSMutableArray *arr_menu;
    
    UITextView *tv_other;
}

@end
