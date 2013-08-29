//
//  NewDatePickerViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewDatePcikerViewControllerDelegate <NSObject>
-(void)delegateConfirm:(NSDate *)date_selected;
@end

@interface NewDatePickerViewController : UIViewController {
    UIViewController *outerViewController;
}

@property (weak, nonatomic) IBOutlet UIView *view_inner;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, assign) id<NewDatePcikerViewControllerDelegate>delegate;


- (UIView *)getDatePickerView:(UIViewController *)viewController;
- (void)moveUpPickerView;
- (IBAction)moveDownPickerView:(id)sender;

@end
