//
//  Discharge3ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/1/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "ModalPickerViewController.h"

@interface Discharge3ViewController : UITableViewController<UITextViewDelegate, ModalPickerViewDelegate> {
    Dashboard *dashboard;
    BOOL flag_first;
    
    int _initialTVHeight;
    
    int i_periIndex;

}
@property (weak, nonatomic) IBOutlet UITextView *tv_other;


@end
