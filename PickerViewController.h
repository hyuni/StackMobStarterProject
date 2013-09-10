//
//  PickerViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 9/9/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerViewControllerDelegate <NSObject>
-(void)delegateConfirm:(NSMutableArray *)arr_selected;
@end

@interface PickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    NSMutableArray *arr_source;
}

@property (weak, nonatomic) IBOutlet UILabel *lb_two_left;
@property (weak, nonatomic) IBOutlet UILabel *lb_two_right;
@property NSArray *arr_source0;
@property NSArray *arr_source1;
@property NSArray *arr_source2;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property NSString *str_title;

//@property NSString *__strong *str_target0;
//@property NSString *__strong *str_target1;
//@property NSString *__strong *str_target2;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, assign) id<PickerViewControllerDelegate>delegate;

@end
