//
//  PickerViewController.h
//  StackMobStarterProject
//
//  Created by kakadais on 8/29/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerViewControllerDelegate <NSObject>
-(void)delegateConfirm:(NSMutableArray *)item_selected;
@end

@interface PickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    UIViewController *outerViewController;
}

@property (nonatomic, assign) id<PickerViewControllerDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) NSMutableArray *arr_pickerData;

- (IBAction)moveDownPickerView:(id)sender;
- (void)moveUpPickerView;
- (void)setPickerView:(UIViewController *)viewController;

@end
