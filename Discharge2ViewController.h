//
//  Discharge2ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/1/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface Discharge2ViewController : UITableViewController<UITextViewDelegate> {
    Dashboard *dashboard;
    int selected_row;
    
    int _initialTVHeight;
    
    BOOL flag_first;
}

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *cells;
@property (weak, nonatomic) IBOutlet UITextView *tv_other;

@end
