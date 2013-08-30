//
//  IntakeForm4InjuryTypeViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface IntakeForm4InjuryTypeViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    int i_component_1_row;
    NSMutableArray *arr_component_0;
    NSMutableArray *arr_component_1;
    
    Dashboard *dashboard;
    
}

@property (weak, nonatomic) IBOutlet UIPickerView *v_picker;
- (IBAction)confirm:(id)sender;

@end
