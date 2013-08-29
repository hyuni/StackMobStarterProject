//
//  IntakeForm4ViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntakeForm4ViewController : UITableViewController<UIPickerViewDelegate> {
    UIPickerView *pickerView;
    UITapGestureRecognizer *tap;
    
    NSMutableArray *arr_injuryType_A;
    NSMutableArray *arr_injuryType_B;
    
    NSMutableArray *arr_component_0;
    NSMutableArray *arr_component_1;
    
    int i_component_1_row;
}

@property (weak, nonatomic) IBOutlet UISwitch *sw_intact;

@end
