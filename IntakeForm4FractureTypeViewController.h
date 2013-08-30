//
//  IntakeForm4FractureTypeViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface IntakeForm4FractureTypeViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    NSMutableArray *arr_component_0;
    
    Dashboard *dashboard;
}

@property (weak, nonatomic) IBOutlet UIPickerView *v_picker;
- (IBAction)confirm:(id)sender;

@end
