//
//  AdverseEventViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/9/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "PickerViewController.h"
#import "ModalPickerViewController.h"

@interface AdverseEventViewController : UITableViewController<UITextViewDelegate, PickerViewControllerDelegate, ModalPickerViewDelegate> {
    NSMutableArray *arr_intra_bool;
    NSMutableArray *arr_menu;
    NSMutableArray *arr_intra;
    
    int i_curIndex;
    
//    Dashboard *dashboard;
    
    NSString *str_intra_0;
    NSString *str_intra_1;
    NSString *str_intra_2;
    NSString *str_intra_3;
    NSString *str_intra_4;
    NSString *str_intra_5;
    NSString *str_intra_6;
    NSString *str_intra_7;
    NSString *str_intra_8;
    NSString *str_intra_9;
    NSString *str_intra_10;
    NSString *str_intra_11;
    NSString *str_intra_12;
    NSString *str_intra_13;
    
    UITextView *tv_other;
}

//@property Dashboard *__strong *dashboard;
@property Dashboard *dashboard;

@end
