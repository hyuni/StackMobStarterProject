//
//  OnePickerViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/30/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dashboard.h"

@interface OnePickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    Dashboard *dashboard;
    NSString *str_mode;
    
    id id_object1;
    id id_object2;
    NSIndexPath *selected_indexpath;
}
@property (weak, nonatomic) IBOutlet UILabel *lb_right;
@property (weak, nonatomic) IBOutlet UILabel *lb_left;

@property (strong, nonatomic) NSMutableArray *arr_component_0;
@property (weak, nonatomic) IBOutlet UIPickerView *v_picker;
- (IBAction)confirm:(id)sender;
- (void)setMode:(NSString *)in_str_mode object1:(id)object1 object2:(id)object2 indexpath:(NSIndexPath *)in_indexpath;
@end
