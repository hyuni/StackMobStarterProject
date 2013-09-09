//
//  Discharge3ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/1/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface Discharge3ViewController : UITableViewController<UITextViewDelegate> {
    Dashboard *dashboard;
    BOOL flag_first;
    
    int _initialTVHeight;

}
@property (weak, nonatomic) IBOutlet UITextView *tv_other;


@end
