//
//  IntakeForm4ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"
#import "AsiaSendData.h"
#import "ModalPickerViewController.h"

@interface IntakeForm4ViewController : UITableViewController<ModalPickerViewDelegate> {
    Dashboard *dashboard;
    NSMutableArray *arr_menu;
    UIStoryboard *storyboard;
    
//    NSMutableArray *arr_asiaSend;
    AsiaSendData *asiaSend;
    
    
}

- (IBAction)save_local:(id)sender;
- (IBAction)cancel_local:(id)sender;


@end
