//
//  BoneGraftViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/10/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface BoneGraftViewController : UITableViewController<UITextViewDelegate> {
    Dashboard *dashboard;
    
    NSMutableArray *arr_menu;
    NSMutableArray *arr_menu_bool;
    
    UITextView *tv_other;

}

@end
